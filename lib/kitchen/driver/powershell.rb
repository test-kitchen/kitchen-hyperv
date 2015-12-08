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
        os_arch == 'AMD64'
      end

      def powershell_64_bit
        if is_64bit?
          'c:\windows\system32\windowspowershell\v1.0\powershell.exe'
        else
          'c:\windows\sysnative\windowspowershell\v1.0\powershell.exe'
        end
      end
      
      def get_memory_config
        if config[:memory_startup].nil?
          config[:memory_startup_bytes]
        else
          config[:memory_startup] * 1048576
        end
      end

      def wrap_command(script)
        base_script_path = File.join(File.dirname(__FILE__), '/../../../support/hyperv.ps1')
        debug("Loading functions from #{base_script_path}")
        new_script = ". #{base_script_path}; " << script
        debug("Wrapped script: #{new_script}")
        "#{powershell_64_bit} -encodedcommand #{encode_command new_script} -outputformat Text"
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

      # rubocop:disable Metrics/AbcSize
      def execute_command(cmd, options = {})
        debug("#Local Command BEGIN (#{cmd})")
        sh = Mixlib::ShellOut.new(cmd, options)
        sh.run_command
        debug("Local Command END #{Util.duration(sh.execution_time)}")
        fail "Failed: #{sh.stderr}" if sh.error?
        JSON.parse(sh.stdout) if sh.stdout.length > 2
      end
      # rubocop:enable Metrics/AbcSize

      def new_differencing_disk_ps
        <<-DIFF

          New-DifferencingDisk -Path "#{differencing_disk_path}" -ParentPath "#{parent_vhd_path}"
        DIFF
      end

      def ensure_vm_running_ps
        <<-RUNNING

          Assert-VmRunning -ID "#{@state[:id]}" | ConvertTo-Json
        RUNNING
      end

      # rubocop:disable Metrics/MethodLength
      def new_vm_ps
        <<-NEWVM

          $NewVMParams = @{
            Generation = #{config[:vm_generation]}
            MemoryStartupBytes = #{get_memory_config}
            Name = "#{instance.name}"
            Path = "#{kitchen_vm_path}"
            VHDPath = "#{differencing_disk_path}"
            SwitchName = "#{config[:vm_switch]}"
            ProcessorCount = #{config[:processor_count]}
            UseDynamicMemory = "#{config[:dynamic_memory]}"
            DynamicMemoryMinBytes = #{config[:dynamic_memory_min_bytes]}
            DynamicMemoryMaxBytes = #{config[:dynamic_memory_max_bytes]}
          }
          New-KitchenVM @NewVMParams | ConvertTo-Json
        NEWVM
      end
      # rubocop:enable Metrics/MethodLength

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
            Set-VMNetworkConfiguration -ipaddress "#{config[:ip_address]}" -subnet 255.255.255.0 |
            ConvertTo-Json
        VMIP
      end

      def vm_default_switch_ps
        <<-VMSWITCH
          Get-DefaultVMSwitch | ConvertTo-Json
        VMSWITCH
      end

      def mount_vm_iso
        <<-MOUNTISO
          mount-vmiso -id "#{@state[:id]}" -Path #{config[:iso_path]}
        MOUNTISO
      end
      
      def copy_vm_file_ps(source, dest)
        <<-FILECOPY
          Function CopyFile ($VM, [string]$SourcePath, [string]$DestPath) {
              #Write-Host "Copying file to VM - Source: $SourcePath Destination $DestPath"
              $VM | Copy-VMFile -SourcePath $SourcePath -DestinationPath $DestPath -CreateFullPath -FileSource Host -Force
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
    end
  end
end
