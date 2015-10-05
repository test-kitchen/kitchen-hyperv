[![Gem Version](https://badge.fury.io/rb/kitchen-hyperv.svg)](http://badge.fury.io/rb/kitchen-hyperv)
# Kitchen::Hyperv

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kitchen-hyperv'
```

## Usage

In the .kitchen.yml

```yaml
driver:
  name: 'hyperv'
```

### Required parameters:

* parent_vhd_folder
  * Location of the base vhd files
* parent_vhd_name
  * Vhd file name for the base vhd file

### Optional parameters:

* memory_startup_bytes
  * amount of RAM to assign to each virtual machine.  Defaults to 536,870,912.
* processor_count
  * number of virtual processors to assign to each virtual machine. Defaults to 2.
* dynamic_memory
  * if true, the amount of memory allocated to a virtual machine is adjusted by Hyper-V dynamically. Defaults to false.
* dynamic_memory_min_bytes / dynamic_memory_max_bytes
  * The minimum and maximum amount of memory Hyper-V will allocate to a virtual machine if dynamic_memory is enabled. Defaults to 536,870,912 and 2,147,483,648 (512MB-2GB)
* ip_address
  * IP address for the virtual machine.  If the VM is not on a network with DHCP, this can be used to assign an IP that can be reached from the host machine.
* vm_switch
  * The virtual switch to attach the guest VMs.  Defaults to the first switch returned from Get-VMSwitch.
* iso_path
  * Path on the host to the ISO to mount on the VMs.
* vm_generation
  * The generation for the hyper-v VM.  Defaults to 1.
* disk_type
  * The type of virtual disk to create, .VHD or .VHDX.  Defaults to the file extension of the parent virtual hard drive.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kitchen-hyperv/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
