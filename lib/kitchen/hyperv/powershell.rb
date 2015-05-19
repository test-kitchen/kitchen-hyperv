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
#

module Kitchen
  module Hyperv
    module PowerShellScripts
      def new_differencing_disk
        <<-DIFF

          New-DifferencingDisk -Path "#{differencing_disk_path}" -ParentPath "#{parent_vhd_path}"
        DIFF
      end

      def ensure_vm_running
        <<-RUNNING

          Assert-VmRunning -ID "#{@state[:id]}" | convertto-json
        RUNNING
      end

      def new_vm
        <<-NEWVM

          $NewVMParams = @{
            Generation = 1
            MemoryStartupBytes = #{config[:memory_startup_bytes]}
            Name = "#{instance.name}"
            Path = "#{kitchen_vm_path}"
            VHDPath = "#{differencing_disk_path}"
            SwitchName = 'LAN'
            ProcessorCount = #{config[:processor_count]}
          }
          New-KitchenVM @NewVMParams | convertto-json
        NEWVM
      end

      def vm_details
        <<-DETAILS

          Get-VmDetail -id "#{@state[:id]}" | convertto-json
        DETAILS
      end

      def delete_vm
        <<-REMOVE

          Get-VM -ID "#{@state[:id]}" |
            Stop-VM -Force -TurnOff -PassThru |
            Remove-VM -Force |
            Out-Null
        REMOVE
      end

      def set_vm_ipaddress
        <<-VMIP 

          (Get-VM -id "#{@state[:id]}").NetworkAdapters | 
            Set-VMNetworkConfiguration -ipaddress "#{config[:ip_address]}" -subnet 255.255.255.0 |
            convertto-json
        VMIP
      end

    end
  end
end