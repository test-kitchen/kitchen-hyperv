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

require 'kitchen/hyperv/version'
require 'kitchen'
require 'fileutils'
require 'pry'

module Kitchen
  module Driver
    class Vagrant < Kitchen::Driver::Base
      kitchen_driver_api_version 2
      plugin_version Kitchen::Hyperv::VERSION

      default_config :parent_vhd
      default_config :memory_startup_bytes, 512
      default_config :processor_count, 2

      include ShellOut

      def create(state)
        create_new_differencing_disk
        create_virtual_machine
        update_state(state)
        instance.transport.connection(state).wait_until_ready
        info("Hyper-V instance #{instance.to_str} created.")
      end

      def destroy(state)
        return if state[:hostname].nil?
        instance.transport.connection(state).close
        remove_virtual_machine
        FileUtils.rm(state[:differencing_disk])
        info("The Hyper-V instance #{instance.to_str} has been removed.")
        state.delete(:hostname)
      end

      def new_differencing_ps
        <<-DIFF
        if (-not (test-path '#{differencing_disk_path}'))
        {
          new-vhd -path '#{differencing_disk_path}' -parentpath 'config[:parent_vhd]' -Differencing
        }
        DIFF
      end

      def create_new_differencing_disk
        run new_differencing_ps
      end

      def new_vm_ps
        <<-NEWVM
          $NewVMParams = @{
            Generation = 1
            MemoryStartupBytes = #{config[:memory_startup_bytes]}
            Name = '#{instance.name}'
            Path = '#{kitchen_vm_path}'
            VHDPath = '#{differencing_disk_path}'
          }
          new-vm @NewVMParams | Set-Vm -ProcessorCount #{config[:processor_count]}
        NEWVM
      end

      def create_virtual_machine
        run new_vm_ps
      end

      def update_state

        state[:hostname] =
      end

      def kitchen_vm_path
        @kitchen_vm_path ||= File.join(config[:kitchen_root], ".kitchen/#{instance.name}" )
      end

      def differencing_disk_path
        @differencing_disk_path ||= File.join('#{kitchen_vm_path}', 'diff.vhd')
      end


      def encode_command(script)
        encoded_script = script.encode('UTF-16LE', 'UTF-8')
        Base64.strict_encode64(encoded_script)
      end
      # Convenience method to run a command locally.
      #
      # @param cmd [String] command to run locally
      # @param options [Hash] options hash
      # @see Kitchen::ShellOut.run_command
      # @api private
      def run(cmd, options = {})
        cmd = "echo #{cmd}" if config[:dry_run]
        cmd = "c:\\windows\\sysnative\\windowspowershell\\v1.0\\powershell.exe -encodedcommand #{encode_command cmd}"
        binding.pry
        run_command(cmd, options)
      end

    end
  end
end
