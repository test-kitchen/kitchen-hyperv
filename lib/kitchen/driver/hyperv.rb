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
#

require "kitchen"
require "kitchen/driver"
require_relative "hyperv_version"
require_relative "powershell"
require "mixlib/shellout" unless defined?(Mixlib::ShellOut)
require "fileutils" unless defined?(FileUtils)
require "json" unless defined?(JSON)
require "train" unless defined?(Train)
require "train-winrm" unless defined?(TrainPlugins::WinRM)

module Kitchen

  # Test Kitchen driver plugins.
  module Driver

    # Test Kitchen driver that builds instances as Hyper-V virtual machines.
    #
    # The driver never talks to Hyper-V directly. It generates PowerShell that
    # calls the helper functions in `support/hyperv.ps1` and runs that script
    # through a Train connection -- a local one on a Hyper-V host, or WinRM
    # when `hyperv_server` points at a remote host.
    #
    # Each instance gets a differencing disk cloned from a shared parent VHD,
    # so creating an instance costs a few seconds and very little disk.
    #
    # @example Minimal kitchen.yml
    #   driver:
    #     name: hyperv
    #     parent_vhd_folder: C:\VHDs
    #     parent_vhd_name: windows-2022.vhdx
    #
    # @see https://github.com/test-kitchen/kitchen-hyperv
    class Hyperv < Kitchen::Driver::Base

      kitchen_driver_api_version 2
      plugin_version Kitchen::Driver::HYPERV_VERSION

      required_config :parent_vhd_folder
      required_config :parent_vhd_name

      default_config :memory_startup_bytes, 536_870_912
      default_config :dynamic_memory_min_bytes, 536_870_912
      default_config :dynamic_memory_max_bytes, 2_147_483_648
      default_config :dynamic_memory, false
      default_config :processor_count, 2
      default_config :ip_address
      default_config :gateway
      default_config :dns_servers
      default_config :subnet, "255.255.255.0"
      default_config :vm_switch
      default_config :vm_vlan_id
      default_config :iso_path
      default_config :boot_iso_path
      default_config :enable_guest_services
      default_config :vm_note
      default_config :resize_vhd
      default_config :additional_disks
      default_config :vm_generation, 1
      default_config :disable_secureboot, false
      default_config :static_mac_address
      default_config :disk_type do |driver|
        File.extname(driver[:parent_vhd_name])
      end

      default_config :hyperv_server, nil
      default_config :hyperv_username, nil
      default_config :hyperv_password, nil
      default_config :hyperv_ssl, false
      default_config :hyperv_insecure, true
      default_config :remote_vm_path, 'C:\Users\Public\Documents\Hyper-V'

      include Kitchen::Driver::PowerShellScripts

      # Create the virtual machine and wait until it is reachable.
      #
      # Runs the full bring-up in order: validate the configuration, clone the
      # parent VHD into a differencing disk, create any additional data disks,
      # create and start the VM, then block on the transport until the guest
      # accepts connections.
      #
      # @param state [Hash] the instance state hash, updated in place with
      #   `:id`, `:hostname` and `:vm_name`
      # @return [void]
      # @raise [RuntimeError] if validation fails or Hyper-V cannot create the VM
      def create(state)
        @state = state
        validate_vm_settings
        create_new_differencing_disk
        create_additional_disks
        create_virtual_machine
        set_virtual_machine_note
        update_state
        mount_virtual_machine_iso
        instance.transport.connection(@state).wait_until_ready
        copy_vm_files
        info("Hyper-V instance #{instance.to_str} created.")
      end

      # Destroy the virtual machine and the disks created alongside it.
      #
      # Safe to call repeatedly and safe to call when the VM was removed out of
      # band: a differencing disk left behind by a partial create is cleaned up
      # even when no VM exists.
      #
      # @param state [Hash] the instance state hash; `:id` is deleted from it
      # @return [void]
      def destroy(state)
        @state = state
        if differencing_disk_exists && !vm_exists_silent
          remove_differencing_disk
        end
        unless vm_exists
          # The VM is gone, but a stale id would make every later run believe
          # otherwise, so clear it rather than returning with it still in place.
          state.delete(:id)
          return
        end

        instance.transport.connection(state).close
        remove_virtual_machine
        remove_differencing_disk
        remove_additional_disks
        info("The Hyper-V instance #{instance.to_str} has been removed.")
        state.delete(:id)
      end

      private

      # Check the configuration before anything is created.
      #
      # Also resolves `vm_switch`, which requires a round trip to the host and
      # so cannot be handled by a plain `default_config` block.
      #
      # @return [void]
      # @raise [RuntimeError] if the parent VHD is missing, the startup memory
      #   falls outside the dynamic memory range, or the VLAN id is not a valid
      #   802.1Q id
      # @api private
      def validate_vm_settings
        raise "Missing parent_vhd_folder" unless vhd_folder? || remote_hyperv
        raise "Missing parent_vhd_name" unless vhd? || remote_hyperv

        if config[:dynamic_memory]
          startup_bytes = integer_config(:memory_startup_bytes)
          min = integer_config(:dynamic_memory_min_bytes)
          max = integer_config(:dynamic_memory_max_bytes)
          memory_valid = startup_bytes.between?(min, max)
          warning = "memory_startup_bytes (#{startup_bytes}) must" \
                    " fall within dynamic memory range (#{min}-#{max})"
          raise warning unless memory_valid
        end
        config[:vm_switch] = vm_switch
        if config[:vm_vlan_id]
          vm_vlan_id = integer_config(:vm_vlan_id)
          vm_vlan_id_min = 1
          vm_vlan_id_max = 4094
          vm_vlan_id_valid = vm_vlan_id.between?(vm_vlan_id_min, vm_vlan_id_max)
          vm_vlan_id_warning = "vm_vlan_id (#{vm_vlan_id}) must be a valid 802.1Q" \
                               " VLAN ID between (#{vm_vlan_id_min}-#{vm_vlan_id_max})"
          raise vm_vlan_id_warning unless vm_vlan_id_valid
        end
      end

      # Clone the parent VHD into this instance's differencing disk.
      #
      # @return [void]
      # @api private
      def create_new_differencing_disk
        info("Creating differencing disk for #{instance.name}.")
        run_ps new_differencing_disk_ps
        info("Created differencing disk for #{instance.name}.")
        set_new_vhd_size
      end

      # Create each disk described by the `additional_disks` config.
      #
      # Records the created paths in `@additional_disk_objects` so
      # {PowerShellScripts#new_vm_ps} can attach them to the new VM.
      #
      # @return [void]
      # @raise [RuntimeError] if a disk entry has no name, or the target file
      #   already exists
      # @api private
      def create_additional_disks
        return if config[:additional_disks].nil?

        @additional_disk_objects = []
        config[:additional_disks].each do |additional_disk|
          raise "Missing name for additional disk" unless additional_disk[:name]

          disk_type = additional_disk[:type] || config[:disk_type]
          disk_path = additional_disk_path(additional_disk[:name], disk_type)
          raise "Additional disk file already exists: #{disk_path}" if File.exist?(disk_path)

          disk_size = additional_disk[:size_gb] || 5
          info("Creating additional disk #{additional_disk[:name]} for #{instance.name}.")
          run_ps new_additional_disk_ps(disk_path, disk_size)
          info("Created additional disk #{additional_disk[:name]} for #{instance.name}.")
          @additional_disk_objects.push(disk_path)
        end
      end

      # Resolve the virtual switch to attach the VM to.
      #
      # With `vm_switch` unset the host picks its first switch; with it set the
      # host confirms that switch exists.
      #
      # @return [String] the switch name
      # @raise [RuntimeError] if the host reports no usable switch
      # @api private
      def vm_switch
        default_switch_object = run_ps vm_default_switch_ps
        if default_switch_object.nil? ||
            !default_switch_object.key?("Name") ||
            default_switch_object["Name"].empty?
          raise "Failed to find a default VM Switch."
        end

        default_switch_object["Name"]
      end

      # Create and start the VM, unless one already exists for this instance.
      #
      # @return [void]
      # @raise [RuntimeError] if the host returns no VM
      # @api private
      def create_virtual_machine
        return if vm_exists

        info("Creating virtual machine for #{instance.name}.")
        new_vm_object = run_ps new_vm_ps
        raise "Unable to create virtual machine for #{instance.name}." if new_vm_object.nil?

        @state[:id] = new_vm_object["Id"]
        info("Created virtual machine for #{instance.name}.")
      end

      # Copy the VM's id, address and name into the instance state.
      #
      # @return [void]
      # @raise [RuntimeError] if the host reports no detail for the VM
      # @api private
      def update_state
        vm_details
        raise "Unable to fetch details for virtual machine #{instance.name}." if @vm.nil?

        @state[:id] = @vm["Id"]
        @state[:hostname] = @vm["IpAddress"]
        @state[:vm_name] = @vm["Name"]
      end

      # Fetch the VM's details from the host, applying a static IP first if one
      # is configured.
      #
      # @return [Hash, nil] the parsed `Get-VmDetail` payload
      # @api private
      def vm_details
        run_ps set_vm_ipaddress_ps if config[:ip_address]
        @vm = run_ps vm_details_ps
      end

      # Attach the configured ISO to the VM's DVD drive.
      #
      # @return [void]
      # @api private
      def mount_virtual_machine_iso
        return unless config[:iso_path]

        info("Mounting #{config[:iso_path]}")
        run_ps mount_vm_iso
        info("Done mounting #{config[:iso_path]}")
      end

      # Grow the disk to `resize_vhd` bytes, when configured.
      #
      # @return [void]
      # @api private
      def set_new_vhd_size
        return unless config[:resize_vhd]

        info("Resizing differencing disk for #{instance.name}.")
        run_ps resize_vhd
        info("Resized differencing disk for #{instance.name}.")
      end

      # Write the configured note onto the VM, so it is identifiable in the
      # Hyper-V manager.
      #
      # @return [void]
      # @api private
      def set_virtual_machine_note
        return unless config[:vm_note]

        info("Adding note to VM: '#{config[:vm_note]}'")
        run_ps set_vm_note
      end

      # Copy the configured files into the running guest.
      #
      # Requires the guest service interface, which `enable_guest_services`
      # turns on.
      #
      # @return [void]
      # @api private
      def copy_vm_files
        return if config[:copy_vm_files].nil?

        info("Copying files to virtual machine")
        config[:copy_vm_files].each do |file_info|
          run_ps copy_vm_file_ps(file_info[:source], file_info[:dest])
        end
        info("Copied files to virtual machine")
      end

      # Whether a VM for this instance exists, starting it if it is stopped.
      #
      # @return [Boolean]
      # @api private
      def vm_exists
        info("Checking for existing virtual machine.")
        return false unless @state.key?(:id) && !@state[:id].nil?

        existing_vm = run_ps ensure_vm_running_ps
        return false if existing_vm.nil? || existing_vm["Id"].nil?

        info("Found an existing VM with an ID: #{existing_vm["Id"]}")
        true
      end

      # {#vm_exists} without the logging.
      #
      # `destroy` checks for a VM twice -- once to decide whether a leftover
      # differencing disk is stale, once to decide whether to remove the VM --
      # and logging both checks makes it look like the driver ran twice.
      #
      # @return [Boolean]
      # @api private
      def vm_exists_silent
        return false unless @state.key?(:id) && !@state[:id].nil?

        existing_vm = run_ps ensure_vm_running_ps
        return false if existing_vm.nil? || existing_vm["Id"].nil?

        true
      end

      # Whether this instance's differencing disk is on disk.
      #
      # @return [Boolean]
      # @api private
      def differencing_disk_exists
        File.exist?(differencing_disk_path)
      end

      # Read a config value that must be numeric.
      #
      # Values coming from `kitchen.yml` may be quoted, and comparing a String
      # against an Integer raises deep inside Comparable rather than reporting
      # anything a user can act on.
      #
      # @param key [Symbol] the config key
      # @return [Integer]
      # @raise [RuntimeError] if the value is not coercible to an Integer
      # @api private
      def integer_config(key)
        value = config[key]
        Integer(value)
      rescue ArgumentError, TypeError
        raise "#{key} (#{value.inspect}) must be an integer"
      end

      # Force the VM off and remove it.
      #
      # @return [void]
      # @api private
      def remove_virtual_machine
        info("Deleting virtual machine for #{instance.name}")
        run_ps delete_vm_ps
        info("Deleted virtual machine for #{instance.name}")
      end

      # Delete this instance's differencing disk, if present.
      #
      # @return [void]
      # @api private
      def remove_differencing_disk
        return unless differencing_disk_exists

        info("Removing the differencing disk for #{instance.name}.")
        FileUtils.rm(differencing_disk_path)
        info("Removed the differencing disk for #{instance.name}.")
      end

      # Delete every configured additional disk that exists.
      #
      # @return [void]
      # @raise [RuntimeError] if a disk entry has no name
      # @api private
      def remove_additional_disks
        return if config[:additional_disks].nil?

        config[:additional_disks].each do |additional_disk|
          raise "Missing name for additional disk" unless additional_disk[:name]

          disk_type = additional_disk[:type] || config[:disk_type]
          disk_path = additional_disk_path(additional_disk[:name], disk_type)
          if File.exist?(disk_path)
            info("Removing additional disk #{additional_disk[:name]} for #{instance.name}.")
            FileUtils.rm(disk_path)
            info("Removed additional disk #{additional_disk[:name]} for #{instance.name}.")
          end
        end
      end

      # Where this instance's files live under the local kitchen root.
      #
      # @return [String]
      # @api private
      def kitchen_vm_path
        @kitchen_vm_path ||= File.join(config[:kitchen_root], ".kitchen/#{instance.name}")
      end

      # Where this instance's files live on a remote Hyper-V host.
      #
      # @return [String]
      # @api private
      def remote_kitchen_vm_path
        config[:remote_vm_path]
      end

      # Directory holding every disk belonging to this instance.
      #
      # A remote host cannot see the local kitchen root, so a remote run keeps
      # its disks under `remote_vm_path` instead.
      #
      # @return [String]
      # @api private
      def vm_base_path
        remote_hyperv ? remote_kitchen_vm_path : kitchen_vm_path
      end

      # ISO to boot the VM from, for building an instance from install media.
      #
      # @return [String, nil]
      # @api private
      def boot_iso_path
        @boot_iso_path ||= config[:boot_iso_path]
      end

      # Full path to this instance's differencing disk.
      #
      # @return [String]
      # @api private
      def differencing_disk_path
        @differencing_disk_path ||= File.join(vm_base_path, "diff#{config[:disk_type]}")
      end

      # Full path to one additional data disk.
      #
      # @param disk_name [String] the disk's configured name
      # @param disk_type [String] the file extension, e.g. `".vhdx"`
      # @return [String]
      # @api private
      def additional_disk_path(disk_name, disk_type)
        File.join(vm_base_path, disk_name + disk_type)
      end

      # Full path to the parent VHD every instance is cloned from.
      #
      # @return [String]
      # @api private
      def parent_vhd_path
        @parent_vhd_path ||= File.join(config[:parent_vhd_folder], config[:parent_vhd_name])
      end

      # Whether the configured parent VHD folder exists locally.
      #
      # @return [Boolean]
      # @api private
      def vhd_folder?
        config[:parent_vhd_folder] && Dir.exist?(config[:parent_vhd_folder])
      end

      # Whether the configured parent VHD file exists locally.
      #
      # @return [Boolean]
      # @api private
      def vhd?
        config[:parent_vhd_name] && File.exist?(parent_vhd_path)
      end

      # Whether the driver is targeting a remote Hyper-V host over WinRM.
      #
      # @return [Boolean]
      # @api private
      def remote_hyperv
        !!config[:hyperv_server]
      end

      # The Train connection commands run over, opened on first use.
      #
      # Uses the `local` backend on a Hyper-V host and `winrm` when
      # `hyperv_server` is set, uploading the support script in that case.
      #
      # @return [Train::Plugins::Transport::BaseConnection]
      # @api private
      def connection
        return @connection if @connection

        backend = remote_hyperv ? "winrm" : "local"

        train = Train.create(backend, {
                              host: config[:hyperv_server],
                              user: config[:hyperv_username],
                              password: config[:hyperv_password],
                              ssl: config[:hyperv_ssl],
                              self_signed: config[:hyperv_insecure],
                            })
        @connection = train.connection

        # Only the remote backend dot-sources the uploaded copy; locally the
        # driver reads the script straight out of the gem.
        @connection.upload(local_script_path, remote_script_path) if remote_hyperv

        @connection
      end

      # Path every generated script dot-sources to load the helper functions.
      #
      # @return [String]
      # @api private
      def base_script_path
        return remote_script_path if remote_hyperv

        local_script_path
      end

      # Path to `support/hyperv.ps1` inside the installed gem.
      #
      # @return [String]
      # @api private
      def local_script_path
        File.expand_path("../../../support/hyperv.ps1", __dir__)
      end

      # Path the support script is uploaded to on a remote host.
      #
      # @return [String]
      # @api private
      def remote_script_path
        File.join(config[:kitchen_root], "kitchen-hyperv", "hyperv.ps1")
      end
    end
  end
end
