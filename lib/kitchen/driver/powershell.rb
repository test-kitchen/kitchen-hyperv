#
# Author:: Steven Murawski <smurawski@chef.io>
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
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

require 'mixlib/shellout'
require 'fileutils'
require 'JSON'

module Kitchen
  module Driver
    module PowerShellScripts
      def encode_command(script)
        encoded_script = script.encode('UTF-16LE', 'UTF-8')
        Base64.strict_encode64(encoded_script)
      end

      def is_64bit?
        os_arch = ENV['PROCESSOR_ARCHITEW6432'] || ENV['PROCESSOR_ARCHITECTURE']
        ruby_arch = ['foo'].pack('p').size == 4 ? 32 : 64
        os_arch == 'AMD64' && ruby_arch == 64
      end

      def is_32bit?
        os_arch = ENV['PROCESSOR_ARCHITEW6432'] || ENV['PROCESSOR_ARCHITECTURE']
        ruby_arch = ['foo'].pack('p').size == 4 ? 32 : 64
        os_arch != 'AMD64' && ruby_arch == 32
      end

      def powershell_64_bit
        if is_64bit? || is_32bit?
          'c:\windows\system32\windowspowershell\v1.0\powershell.exe'
        else
          'c:\windows\sysnative\windowspowershell\v1.0\powershell.exe'
        end
      end

      def wrap_command(script)
        base_script_path = File.join(File.dirname(__FILE__), '/../../../support/hyperv.ps1')
        debug("Loading functions from #{base_script_path}")
        new_script = [ ". #{base_script_path}", "#{script}" ].join(";\n")
        debug("Wrapped script: #{new_script}")
        "#{powershell_64_bit} -noprofile -executionpolicy bypass" \
        " -encodedcommand #{encode_command new_script} -outputformat Text"
      end

      # Convenience method to run a powershell command locally.
      #
      # @param cmd [String] command to run locally
      # @param options [Hash] options hash
      # @see Kitchen::ShellOut.run_command
      # @api private
      def run_ps(cmd, options = {})
        cmd = "echo #{cmd}" if config[:dry_run]
        debug('Preparing to run: ')
        debug("  #{cmd}")
        wrapped_command = wrap_command cmd
        execute_command wrapped_command, options
      end

      def execute_command(cmd, options = {})
        debug("#Local Command BEGIN (#{cmd})")
        sh = Mixlib::ShellOut.new(cmd, options)
        sh.run_command
        debug("Local Command END #{Util.duration(sh.execution_time)}")
        raise "Failed: #{sh.stderr}" if sh.error?
        stdout = sanitize_stdout(sh.stdout)
        JSON.parse(stdout) if stdout.length > 2
      end

      def sanitize_stdout(stdout)
        stdout.split("\n").select { |s| !s.start_with?("PS") }.join("\n")
      end

      def new_differencing_disk_ps
        <<-DIFF

          New-DifferencingDisk -Path "#{differencing_disk_path}" -ParentPath "#{parent_vhd_path}"
        DIFF
      end

      def new_additional_disk_ps(disk_path, disk_size)
        <<-ADDDISK

          New-VHD -Path "#{disk_path}" -SizeBytes #{disk_size}GB | Out-Null
        ADDDISK
      end

      def ensure_vm_running_ps
        <<-RUNNING

          Assert-VmRunning -ID "#{@state[:id]}" | ConvertTo-Json
        RUNNING
      end

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
            VlanId = #{config[:vm_vlan_id] || '$null'}
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

      def additional_disks
        return if config[:additional_disks].nil?
        <<-EOH
        AdditionalDisks = @("#{@additional_disk_objects.join('","')}")
        EOH
      end

      def vm_details_ps
        <<-DETAILS

          Get-VmDetail -id "#{@state[:id]}" | ConvertTo-Json
        DETAILS
      end

      def delete_vm_ps
        <<-REMOVE

          $null = Get-VM -ID "#{@state[:id]}" |
            Stop-VM -Force -TurnOff -PassThru |
            Remove-VM -Force
        REMOVE
      end

      def set_vm_ipaddress_ps
        <<-VMIP

          (Get-VM -id "#{@state[:id]}").NetworkAdapters |
            Set-VMNetworkConfiguration -ipaddress "#{config[:ip_address]}" `
              -subnet "#{config[:subnet]}" `
              -gateway "#{config[:gateway]}" `
              -dnsservers #{ruby_array_to_ps_array(config[:dns_servers])} |
            ConvertTo-Json
        VMIP
      end

      def vm_default_switch_ps
        <<-VMSWITCH
          Get-DefaultVMSwitch #{config[:vm_switch]} | ConvertTo-Json
        VMSWITCH
      end

      def mount_vm_iso
        <<-MOUNTISO
          mount-vmiso -id "#{@state[:id]}" -Path #{config[:iso_path]}
        MOUNTISO
      end

      def resize_vhd
        <<-VMNOTE
          Resize-VHD -Path "#{parent_vhd_path}" -SizeBytes #{config[:resize_vhd]}
        VMNOTE
      end

      def set_vm_note
        <<-VMNOTE
          Set-VM -Name (Get-VM | Where-Object{ $_.ID -eq "#{@state[:id]}"}).Name -Note "#{config[:vm_note]}"
        VMNOTE
      end

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

      def ruby_array_to_ps_array(list)
        return "@()" if list.nil? || list.empty?
        list.to_s.tr('[]','()').prepend('@')
      end
    end
  end
end
