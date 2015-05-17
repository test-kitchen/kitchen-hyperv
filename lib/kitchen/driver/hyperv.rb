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
require 'kitchen/hyperv/version'
require 'kitchen/hyperv/powershell'
require "mixlib/shellout"
require 'fileutils'
require 'JSON'



module Kitchen
  module Driver
    class Hyperv < Kitchen::Driver::Base
      kitchen_driver_api_version 2
      plugin_version Kitchen::Hyperv::VERSION

      default_config :parent_vhd_folder
      default_config :parent_vhd_name
      default_config :memory_startup_bytes, 536870912
      default_config :processor_count, 2
      default_config :password
      default_config :username, 'Administrator'
      default_config :ip_address

      include Kitchen::Hyperv::PowerShellScripts

      def create(state)
        @state = state
        create_new_differencing_disk
        create_virtual_machine
        update_state
        instance.transport.connection(@state).wait_until_ready
        info("Hyper-V instance #{instance.to_str} created.")
      end

      def destroy(state)
        @state = state
        if vm_exists
          instance.transport.connection(state).close
          remove_virtual_machine
          remove_differencing_disk
          info("The Hyper-V instance #{instance.to_str} has been removed.")
          state.delete(:id)
        end
      end

      private

      def kitchen_vm_path
        @kitchen_vm_path ||= File.join(config[:kitchen_root], ".kitchen/#{instance.name}" )
      end

      def differencing_disk_path
        @differencing_disk_path ||= File.join(kitchen_vm_path, 'diff.vhd')
      end

      def parent_vhd_path
        @parent_vhd_path ||= File.join(config[:parent_vhd_folder], config[:parent_vhd_name])
      end

      def vm_exists
        if @state.has_key?(:id) && (!@state[:id].nil?)
          info("Checking for existing virtual machine.")
          existing_vm = run_ps ensure_vm_running
          if (!existing_vm.nil?) && (!existing_vm['Id'].nil?)
            info("Found an exising VM with an ID: #{existing_vm['Id']}")
            return true
          end
        end
        info("No existing virtual machine found for this instance.")
        false
      end

      def remove_differencing_disk
        info("Removing the differencing disk for #{instance.name}.")
        FileUtils.rm(differencing_disk_path)
        info("Removed the differencing disk for #{instance.name}.")
      end

      def create_new_differencing_disk
        unless File.exist? differencing_disk_path
          info("Creating differencing disk for #{instance.name}.")
          run_ps new_differencing_disk
          info("Created differencing disk for #{instance.name}.")
        end
      end

      def remove_virtual_machine
        info("Deleting virtual machine for #{instance.name}")
        run_ps delete_vm
        info("Deleted virtual machine for #{instance.name}")
      end

      def create_virtual_machine
        unless vm_exists
          info("Creating virtual machine for #{instance.name}.")
          new_vm_object = run_ps new_vm
          @state[:id] = new_vm_object['Id']
          info("Created virtual machine for #{instance.name}.")
        end
      end

      def update_state
        get_vm_details
        @state[:id] = @vm['Id']
        @state[:hostname] = @vm['IpAddress']
        @state[:vm_name] = @vm['Name']
        @state[:password] = config[:password]
        @state[:username] = config[:username]
      end

      def get_vm_details
        run_ps set_vm_ipaddress if config[:ip_address]
        @vm = run_ps vm_details
      end

      def encode_command(script)
        encoded_script = script.encode('UTF-16LE', 'UTF-8')
        Base64.strict_encode64(encoded_script)
      end

      def powershell_64_bit
        "c:\\windows\\sysnative\\windowspowershell\\v1.0\\powershell.exe"
      end

      def wrap_command(script)
        base_script_path = File.join(File.dirname(__FILE__), "/../support/hyperv.ps1")
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
        debug("Preparing to run: ")
        debug("  #{cmd}")
        wrapped_command = wrap_command cmd
        debug("#Local Command BEGIN (#{wrapped_command})")
        sh = Mixlib::ShellOut.new(wrapped_command, options)
        sh.run_command
        debug("Local Command END #{Util.duration(sh.execution_time)}")
        raise "Failed: #{sh.stderr}" if sh.error?
        JSON.parse(sh.stdout) if sh.stdout.length > 2
      end

    end
  end
end
