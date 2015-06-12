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

require 'kitchen'
require 'kitchen/driver'
require 'kitchen/driver/hyperv_version'
require 'kitchen/driver/powershell'
require 'mixlib/shellout'
require 'fileutils'
require 'JSON'

module Kitchen

  module Driver

    # Driver for Hyper-V
    class Hyperv < Kitchen::Driver::Base

      kitchen_driver_api_version 2
      plugin_version Kitchen::Driver::HYPERV_VERSION

      default_config :parent_vhd_folder
      default_config :parent_vhd_name
      default_config :memory_startup_bytes, 536_870_912
      default_config :processor_count, 2
      default_config :ip_address
      default_config :vm_switch

      include Kitchen::Driver::PowerShellScripts

      def create(state)
        @state = state
        validate_vm_settings
        create_new_differencing_disk
        create_virtual_machine
        update_state
        instance.transport.connection(@state).wait_until_ready
        info("Hyper-V instance #{instance.to_str} created.")
      end

      def destroy(state)
        @state = state
        return unless vm_exists
        instance.transport.connection(state).close
        remove_virtual_machine
        remove_differencing_disk
        info("The Hyper-V instance #{instance.to_str} has been removed.")
        state.delete(:id)
      end

      private

      def validate_vm_settings
        return if config[:vm_switch]
        config[:vm_switch] = (run_ps vm_default_switch_ps)['Name']
      end

      def kitchen_vm_path
        @kitchen_vm_path ||= File.join(config[:kitchen_root], ".kitchen/#{instance.name}")
      end

      def differencing_disk_path
        @differencing_disk_path ||= File.join(kitchen_vm_path, 'diff.vhd')
      end

      def parent_vhd_path
        @parent_vhd_path ||= File.join(config[:parent_vhd_folder], config[:parent_vhd_name])
      end

      def vm_exists
        info('Checking for existing virtual machine.')
        return false unless @state.key?(:id) && !@state[:id].nil?
        existing_vm = run_ps ensure_vm_running_ps
        info("Found an exising VM with an ID: #{existing_vm['Id']}")
        return true unless existing_vm.nil? || existing_vm['Id'].nil?
        #fail('Failed to start existing VM.')
      end

      def remove_differencing_disk
        info("Removing the differencing disk for #{instance.name}.")
        FileUtils.rm(differencing_disk_path)
        info("Removed the differencing disk for #{instance.name}.")
      end

      def create_new_differencing_disk
        return if File.exist? differencing_disk_path
        info("Creating differencing disk for #{instance.name}.")
        run_ps new_differencing_disk_ps
        info("Created differencing disk for #{instance.name}.")
      end

      def remove_virtual_machine
        info("Deleting virtual machine for #{instance.name}")
        run_ps delete_vm_ps
        info("Deleted virtual machine for #{instance.name}")
      end

      def create_virtual_machine
        return if vm_exists
        info("Creating virtual machine for #{instance.name}.")
        new_vm_object = run_ps new_vm_ps
        @state[:id] = new_vm_object['Id']
        info("Created virtual machine for #{instance.name}.")
      end

      def update_state
        vm_details
        @state[:id] = @vm['Id']
        @state[:hostname] = @vm['IpAddress']
        @state[:vm_name] = @vm['Name']
      end

      def vm_details
        run_ps set_vm_ipaddress_ps if config[:ip_address]
        @vm = run_ps vm_details_ps
      end
    end
  end
end
