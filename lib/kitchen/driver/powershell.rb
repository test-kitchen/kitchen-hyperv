# frozen_string_literal: true

#
# Author:: Steven Murawski <smurawski@chef.io>
# Copyright:: Copyright (c) 2020 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "base64" unless defined?(Base64)
require "benchmark" unless defined?(Benchmark)
require "rbconfig/sizeof" unless defined?(RbConfig::SIZEOF)
require "fileutils" unless defined?(FileUtils)
require "json" unless defined?(JSON)

module Kitchen
  module Driver
    # PowerShell generation and execution for {Kitchen::Driver::Hyperv}.
    #
    # Every method here is either a script generator -- a `*_ps` method
    # returning PowerShell source -- or part of the pipeline that runs one:
    # {#run_ps} wraps the script so it dot-sources `support/hyperv.ps1`,
    # {#encode_command} encodes it for `powershell.exe -encodedcommand`, and
    # {#execute_command} runs it over the Train connection and parses the JSON
    # that comes back.
    #
    # Encoding sidesteps every layer of quoting between Ruby and PowerShell,
    # which matters because these scripts embed Windows paths and user-supplied
    # strings.
    #
    # The module reads `config`, `instance` and `@state` from the driver it is
    # mixed into, so it is not usable standalone.
    #
    # @see Kitchen::Driver::Hyperv
    module PowerShellScripts
      # Values Windows reports in PROCESSOR_ARCHITECTURE for a 64-bit OS.
      #
      # ARM64 matters for Windows on ARM devices, which run Hyper-V: matching
      # only AMD64 there made both width checks false and sent the driver to
      # the Sysnative path, which does not exist for a native 64-bit process.
      SIXTY_FOUR_BIT_ARCHITECTURES = %w{AMD64 ARM64 IA64}.freeze

      # Encode a script the way `powershell.exe -encodedcommand` expects it:
      # UTF-16LE, then Base64.
      #
      # @param script [String] UTF-8 PowerShell source
      # @return [String] strict Base64, with no line breaks
      # @api private
      def encode_command(script)
        encoded_script = script.encode("UTF-16LE", "UTF-8")
        Base64.strict_encode64(encoded_script)
      end

      # The OS architecture, seeing through WOW64.
      #
      # A 32-bit process on 64-bit Windows reads its own architecture from
      # PROCESSOR_ARCHITECTURE; PROCESSOR_ARCHITEW6432 is what reveals the real
      # one, and is only set in that case.
      #
      # @return [String, nil]
      # @api private
      def os_architecture
        ENV["PROCESSOR_ARCHITEW6432"] || ENV["PROCESSOR_ARCHITECTURE"]
      end

      # Pointer width of the running Ruby, in bits.
      #
      # @return [Integer] 32 or 64
      # @api private
      def ruby_architecture_bits
        RbConfig::SIZEOF.fetch("void*", 8) * 8
      end

      # Whether a 64-bit PowerShell is directly reachable.
      #
      # Always true for a remote host, where the local architecture is
      # irrelevant.
      #
      # @return [Boolean]
      # @api private
      def sixty_four_bit?
        return true if remote_hyperv

        SIXTY_FOUR_BIT_ARCHITECTURES.include?(os_architecture) &&
          ruby_architecture_bits == 64
      end

      # Whether both the OS and Ruby are 32-bit, so no WOW64 redirection is in
      # play.
      #
      # @return [Boolean]
      # @api private
      def thirty_two_bit?
        !SIXTY_FOUR_BIT_ARCHITECTURES.include?(os_architecture) &&
          ruby_architecture_bits == 32
      end

      # @deprecated Use {#sixty_four_bit?}. Kept because this module is mixed
      #   into a published driver class.
      # @return [Boolean]
      # @api private
      def is_64bit?
        sixty_four_bit?
      end

      # @deprecated Use {#thirty_two_bit?}. Kept because this module is mixed
      #   into a published driver class.
      # @return [Boolean]
      # @api private
      def is_32bit?
        thirty_two_bit?
      end

      # Path to a PowerShell that can see the Hyper-V cmdlets.
      #
      # When a 32-bit Ruby runs on 64-bit Windows the WOW64 filesystem
      # redirector rewrites `system32` to `SysWOW64`, which would launch a
      # 32-bit PowerShell with no Hyper-V module. `sysnative` is the virtual
      # path that escapes redirection.
      #
      # @return [String]
      # @api private
      def powershell_64_bit
        if sixty_four_bit? || thirty_two_bit?
          'c:\windows\system32\windowspowershell\v1.0\powershell.exe'
        else
          'c:\windows\sysnative\windowspowershell\v1.0\powershell.exe'
        end
      end

      # Turn a script into a full `powershell.exe` command line.
      #
      # Prepends a dot-source of the support script so the helper functions are
      # defined, then encodes the result.
      #
      # @param script [String] PowerShell source
      # @return [String] the command line to hand to the connection
      # @api private
      def wrap_command(script)
        debug("Loading functions from #{base_script_path}")
        new_script = [ ". #{base_script_path}", "#{script}" ].join(";\n")
        debug("Wrapped script: #{new_script}")
        "#{powershell_64_bit} -noprofile -executionpolicy bypass" \
        " -encodedcommand #{encode_command new_script} -outputformat Text"
      end

      # Run a PowerShell script on the Hyper-V host.
      #
      # With `dry_run` set the script is echoed rather than executed, which is
      # the quickest way to see exactly what the driver would have run.
      #
      # @param cmd [String] PowerShell source
      # @param options [Hash] options passed through to the Train connection
      # @return [Hash, Array, nil] the parsed JSON output, or nil when the
      #   script produced none
      # @raise [RuntimeError] if the script exits non-zero
      # @api private
      def run_ps(cmd, options = {})
        cmd = "echo #{cmd}" if config[:dry_run]
        debug("Preparing to run: ")
        debug("  #{cmd}")
        wrapped_command = wrap_command cmd
        execute_command wrapped_command, options
      end

      # Run a prepared command line and parse its output.
      #
      # @param cmd [String] the full command line from {#wrap_command}
      # @param options [Hash] options passed through to the Train connection
      # @return [Hash, Array, nil] the parsed JSON output, or nil when the
      #   script produced none
      # @raise [RuntimeError] if the command exits non-zero
      # @api private
      def execute_command(cmd, options = {})
        debug("#Command BEGIN (#{cmd})")

        sh = nil
        bm = Benchmark.measure do
          sh = connection.run_command(cmd, options)
        end

        debug("Command END #{Util.duration(bm.total)}")
        raise "Failed: #{sh.stderr}" if sh.exit_status != 0

        stdout = sanitize_stdout(sh.stdout)
        return if stdout.length <= 2

        begin
          JSON.parse(stdout)
        rescue JSON::ParserError => e
          # A bare JSON::ParserError names an offset in a string the user never
          # sees, which is useless for working out what the host actually said.
          raise "Expected JSON from the Hyper-V host but could not parse its " \
                "output (#{e.message}). The host returned:\n#{stdout}"
        end
      end

      # Strip the interactive prompt lines PowerShell interleaves with output,
      # which would otherwise make the result invalid JSON.
      #
      # @param stdout [String] raw stdout from the host
      # @return [String] stdout with prompt lines removed
      # @api private
      def sanitize_stdout(stdout)
        stdout.split("\n").select { |s| !s.start_with?("PS") }.join("\n")
      end

      # Script that clones the parent VHD into this instance's differencing
      # disk.
      #
      # @return [String] PowerShell source
      # @api private
      def new_differencing_disk_ps
        <<-DIFF

          New-DifferencingDisk -Path "#{differencing_disk_path}" -ParentPath "#{parent_vhd_path}"
        DIFF
      end

      # Script that creates one additional data disk.
      #
      # @param disk_path [String] full path of the disk to create
      # @param disk_size [Integer] size in gigabytes
      # @return [String] PowerShell source
      # @api private
      def new_additional_disk_ps(disk_path, disk_size)
        <<-ADDDISK

          New-VHD -Path "#{disk_path}" -SizeBytes #{disk_size}GB | Out-Null
        ADDDISK
      end

      # Script that confirms the VM exists and starts it if it is stopped.
      #
      # @return [String] PowerShell source
      # @api private
      def ensure_vm_running_ps
        <<-RUNNING

          Assert-VmRunning -ID "#{@state[:id]}" | ConvertTo-Json
        RUNNING
      end

      # Script that creates the VM from the current configuration.
      #
      # @return [String] PowerShell source
      # @api private
      def new_vm_ps
        <<-NEWVM

          $NewVMParams = @{
            Generation = #{config[:vm_generation]}
            DisableSecureBoot = "#{config[:disable_secureboot]}"
            MemoryStartupBytes = #{config[:memory_startup_bytes]}
            StaticMacAddress = "#{config[:static_mac_address]}"
            Name = "#{instance.name}"
            Path = "#{kitchen_vm_path}"
            VHDPath = "#{differencing_disk_path}"
            SwitchName = "#{config[:vm_switch]}"
            VlanId = #{config[:vm_vlan_id] || "$null"}
            ProcessorCount = #{config[:processor_count]}
            UseDynamicMemory = "#{config[:dynamic_memory]}"
            DynamicMemoryMinBytes = #{config[:dynamic_memory_min_bytes]}
            DynamicMemoryMaxBytes = #{config[:dynamic_memory_max_bytes]}
            boot_iso_path = "#{boot_iso_path}"
            EnableGuestServices = "#{config[:enable_guest_services]}"
            #{additional_disks}
          }
          New-KitchenVM @NewVMParams | ConvertTo-Json
        NEWVM
      end

      # The `AdditionalDisks` entry spliced into {#new_vm_ps}.
      #
      # Reads the paths {Hyperv#create_additional_disks} recorded, so it is only
      # meaningful after that has run.
      #
      # @return [String, nil] the parameter line, or nil when no additional
      #   disks are configured
      # @api private
      def additional_disks
        return if config[:additional_disks].nil?

        <<-EOH
        AdditionalDisks = @("#{@additional_disk_objects.join('","')}")
        EOH
      end

      # Script that reads the VM's name, id and IP address.
      #
      # @return [String] PowerShell source
      # @api private
      # @todo Report if VM has no IP address instead of silently waiting forever
      def vm_details_ps
        <<-DETAILS

          Get-VmDetail -id "#{@state[:id]}" | ConvertTo-Json
        DETAILS
      end

      # Script that reads the VM's current power state without changing it.
      #
      # Unlike {#ensure_vm_running_ps}, this never starts a stopped VM, so it is
      # safe for `kitchen list --probe`.
      #
      # @return [String] PowerShell source
      # @api private
      def vm_status_ps
        <<-STATUS

          Get-VmStatus -Id "#{@state[:id]}" | ConvertTo-Json
        STATUS
      end

      # Script that reports whether the Hyper-V PowerShell module is installed.
      #
      # @return [String] PowerShell source
      # @api private
      def hyperv_module_ps
        <<-MODULE

          Get-Module -ListAvailable -Name Hyper-V |
            Select-Object -First 1 |
            ForEach-Object { [pscustomobject]@{ Name = $_.Name; Version = [string]$_.Version } } |
            ConvertTo-Json
        MODULE
      end

      # Script that forces the VM off and removes it.
      #
      # @return [String] PowerShell source
      # @api private
      def delete_vm_ps
        <<-REMOVE

          $null = Get-VM -ID "#{@state[:id]}" |
            Stop-VM -Force -TurnOff -PassThru |
            Remove-VM -Force
        REMOVE
      end

      # Script that assigns the VM a static address once its adapter is up.
      #
      # @return [String] PowerShell source
      # @api private
      def set_vm_ipaddress_ps
        <<-VMIP

          while ((Get-VM -id "#{@state[:id]}").NetworkAdapters[0].Status -ne 'Ok'){
            start-sleep 10
          }

          (Get-VM -id "#{@state[:id]}").NetworkAdapters |
            Set-VMNetworkConfiguration -ipaddress "#{config[:ip_address]}" `
              -subnet "#{config[:subnet]}" `
              -gateway "#{config[:gateway]}" `
              -dnsservers #{ruby_array_to_ps_array(config[:dns_servers])} |
            ConvertTo-Json
        VMIP
      end

      # Script that resolves the virtual switch to attach the VM to.
      #
      # @return [String] PowerShell source
      # @api private
      def vm_default_switch_ps
        <<-VMSWITCH
          Get-DefaultVMSwitch "#{config[:vm_switch]}" | ConvertTo-Json
        VMSWITCH
      end

      # Script that attaches the configured ISO to the VM's DVD drive.
      #
      # The path is quoted: unquoted, PowerShell splits an ISO path containing
      # a space into two arguments and binds only the first to -Path.
      #
      # @return [String] PowerShell source
      # @api private
      def mount_vm_iso
        <<-MOUNTISO
          mount-vmiso -id "#{@state[:id]}" -Path "#{config[:iso_path]}"
        MOUNTISO
      end

      # Script that grows the parent VHD to the configured size.
      #
      # @return [String] PowerShell source
      # @api private
      def resize_vhd
        <<-VMNOTE
          Resize-VHD -Path "#{parent_vhd_path}" -SizeBytes #{config[:resize_vhd]}
        VMNOTE
      end

      # Script that writes the configured note onto the VM.
      #
      # @return [String] PowerShell source
      # @api private
      def set_vm_note
        <<-VMNOTE
          Set-VM -Name (Get-VM | Where-Object{ $_.ID -eq "#{@state[:id]}"}).Name -Note "#{config[:vm_note]}"
        VMNOTE
      end

      # Script that copies a file or directory into the running guest.
      #
      # Enables the guest service interface first if it is off, and walks a
      # directory source file by file since `Copy-VMFile` handles only files.
      #
      # @param source [String] path on the Hyper-V host
      # @param dest [String] path inside the guest
      # @return [String] PowerShell source
      # @api private
      def copy_vm_file_ps(source, dest)
        <<-FILECOPY
          Function CopyFile ($VM, [string]$SourcePath, [string]$DestPath) {
              $p = @{ CreateFullPath = $true ; FileSource = 'Host'; Force = $true }
              $VM |
                Copy-VMFile -SourcePath $SourcePath -DestinationPath $DestPath @p
          }

          $sourceLocation = '#{source}'
          $destinationLocation = '#{dest}'
          $vmId = '#{@state[:id]}'
          If (Test-Path $sourceLocation) {
              $vm = Get-VM -ID $vmId
              $service = 'Guest Service Interface'

              If ((Get-VMIntegrationService -Name $service -VM $vm).Enabled -ne $true) {
                  Enable-VMIntegrationService -Name $service -VM $vm
                  Start-Sleep -Seconds 3
              }

              If ((Get-Item $sourceLocation) -is [System.IO.DirectoryInfo]) {
                  ForEach ($item in (Get-ChildItem -Path $sourceLocation -File)) {
                      $destFullPath = (Join-Path $destinationLocation $item.Name)
                      CopyFile $vm $item.FullName $destFullPath
                  }
              }
              Else {
                CopyFile $vm $sourceLocation $destinationLocation
              }
          }
          else {
              Write-Error "Source file path does not exist: $sourceLocation"
          }
        FILECOPY
      end

      private

      # Render a Ruby array as a PowerShell array literal.
      #
      # @param list [Array<String>, nil] the values
      # @return [String] e.g. `@("8.8.8.8", "8.8.4.4")`, or `@()` when empty
      # @api private
      def ruby_array_to_ps_array(list)
        return "@()" if list.nil? || list.empty?

        list.to_s.tr("[]", "()").prepend("@")
      end
    end
  end
end
