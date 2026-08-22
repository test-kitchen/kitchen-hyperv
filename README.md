# kitchen-hyperv

[![Gem Version](https://badge.fury.io/rb/kitchen-hyperv.svg)](http://badge.fury.io/rb/kitchen-hyperv)

A [Test Kitchen](https://github.com/test-kitchen/test-kitchen) driver for [Microsoft Hyper-V](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/). It creates test instances as differencing-disk virtual machines from a parent VHD, which makes them fast to create and cheap on disk.

> This documentation uses [Cinc Workstation](https://cinc.sh/) and the `cinc` commands throughout. Everything here works identically with Chef Workstation — see [Using with Chef](#using-with-chef).

## Requirements

- Windows with the Hyper-V role enabled, either locally or on a remote server
- An administrative shell, since Hyper-V cmdlets require elevation
- Ruby 3.1 or later (already satisfied if you use Cinc Workstation)
- A parent VHD or VHDX to create test instances from

Enable Hyper-V if it is not already present, then reboot:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

## Installation

This driver ships as part of [Cinc Workstation](https://cinc.sh/start/workstation/). If you have Cinc Workstation installed, there is nothing else to install.

To install it into a standalone Ruby:

```sh
gem install kitchen-hyperv
```

Or with Bundler, add it to your `Gemfile`:

```ruby
gem "kitchen-hyperv"
```

...then run `bundle install`.

## Quick Start

This driver needs a parent VHD to clone from. Point `parent_vhd_folder` at the directory holding it and `parent_vhd_name` at the file:

```yaml
---
driver:
  name: hyperv
  parent_vhd_folder: C:\hyper-v\base-images
  parent_vhd_name: ubuntu-2204.vhdx
  memory_startup_bytes: 2147483648
  processor_count: 2

provisioner:
  name: cinc_infra

verifier:
  name: cinc_auditor

platforms:
  - name: ubuntu-22.04

suites:
  - name: default
    run_list:
      - recipe[my_cookbook::default]
```

Then run the full test cycle from an elevated shell:

```sh
cinc kitchen test
```

Or step through it:

```sh
cinc kitchen create    # clone the parent VHD and start the VM
cinc kitchen converge  # apply your cookbook
cinc kitchen verify    # run your tests
cinc kitchen destroy   # stop and delete the VM and its differencing disk
```

## How instances are created

The driver never modifies your parent VHD. For each instance it creates a
differencing disk backed by `parent_vhd_name`, attaches it to a new VM, and
deletes that disk on `destroy`. This means a single parent image can back many
concurrent test instances.

## Configuration

All options below are set under the `driver:` key in `kitchen.yml`.

### Required

| Option | Default | Description |
| --- | --- | --- |
| `parent_vhd_folder` | *none* | Directory containing the parent VHD/VHDX. Required. |
| `parent_vhd_name` | *none* | File name of the parent VHD/VHDX, including the extension. Required. |

### Virtual machine

| Option | Default | Description |
| --- | --- | --- |
| `vm_generation` | `1` | Hyper-V VM generation. Use `2` for UEFI guests. |
| `processor_count` | `2` | Number of virtual processors. |
| `vm_note` | *unset* | Text set as the VM's Notes field in Hyper-V Manager. |
| `disable_secureboot` | `false` | Disable Secure Boot. Usually required for generation 2 Linux guests. |
| `enable_guest_services` | *unset* | Enable the Hyper-V guest services integration component, required for `copy_vm_files`. |
| `disk_type` | extension of `parent_vhd_name` | Disk format for created disks, `.vhd` or `.vhdx`. Defaults to matching the parent. |
| `resize_vhd` | *unset* | Size in bytes to grow the instance's differencing disk to after creation. |
| `additional_disks` | *unset* | Array of extra data disks to create and attach. See [Additional disks](#additional-disks). |

### Memory

| Option | Default | Description |
| --- | --- | --- |
| `memory_startup_bytes` | `536870912` (512 MB) | Memory assigned at boot, in bytes. |
| `dynamic_memory` | `false` | Enable Hyper-V dynamic memory. |
| `dynamic_memory_min_bytes` | `536870912` (512 MB) | Minimum memory when `dynamic_memory` is enabled, in bytes. |
| `dynamic_memory_max_bytes` | `2147483648` (2 GB) | Maximum memory when `dynamic_memory` is enabled, in bytes. |

### Networking

| Option | Default | Description |
| --- | --- | --- |
| `vm_switch` | default switch | Name of the Hyper-V virtual switch to attach to. Falls back to the host's default switch. |
| `vm_vlan_id` | *unset* | VLAN ID to tag the VM's network adapter with. |
| `static_mac_address` | *unset* | Static MAC address for the network adapter. Hyper-V assigns a dynamic one if unset. |
| `ip_address` | *from DHCP* | Static IP address to assign to the guest. |
| `subnet` | `"255.255.255.0"` | Subnet mask used with `ip_address`. |
| `gateway` | *unset* | Default gateway used with `ip_address`. |
| `dns_servers` | *unset* | Array of DNS servers used with `ip_address`. |

### Media

| Option | Default | Description |
| --- | --- | --- |
| `iso_path` | *unset* | Path to an ISO to mount as a DVD drive on the instance. |
| `boot_iso_path` | *unset* | Path to an ISO to attach and boot from. |

### File copy

| Option | Default | Description |
| --- | --- | --- |
| `copy_vm_files` | *unset* | Array of `{source, dest}` hashes copied into the guest after it becomes reachable. Requires `enable_guest_services`. |

### Remote Hyper-V host

By default the driver drives the local Hyper-V host. Set `hyperv_server` to run against a remote one over PowerShell remoting.

| Option | Default | Description |
| --- | --- | --- |
| `hyperv_server` | `nil` | Hostname of a remote Hyper-V server. Uses the local host if unset. |
| `hyperv_username` | `nil` | Username for the remote server. |
| `hyperv_password` | `nil` | Password for the remote server. |
| `hyperv_ssl` | `false` | Connect over HTTPS rather than HTTP. |
| `hyperv_insecure` | `true` | Skip certificate validation when `hyperv_ssl` is enabled. |
| `remote_vm_path` | `C:\Users\Public\Documents\Hyper-V` | Path on the remote server where VM files are stored. |

### Debugging

| Option | Default | Description |
| --- | --- | --- |
| `dry_run` | `false` | Echo the generated PowerShell instead of running it. Useful for debugging the driver. |

## Examples

### Generation 2 Linux guest

Generation 2 VMs boot via UEFI, and most Linux images need Secure Boot turned off.

```yaml
driver:
  name: hyperv
  parent_vhd_folder: C:\hyper-v\base-images
  parent_vhd_name: ubuntu-2204.vhdx
  vm_generation: 2
  disable_secureboot: true
  memory_startup_bytes: 2147483648
```

### Dynamic memory

```yaml
driver:
  name: hyperv
  parent_vhd_folder: C:\hyper-v\base-images
  parent_vhd_name: windows-2022.vhdx
  dynamic_memory: true
  dynamic_memory_min_bytes: 1073741824
  dynamic_memory_max_bytes: 4294967296
```

### Static networking on a specific switch

```yaml
driver:
  name: hyperv
  parent_vhd_folder: C:\hyper-v\base-images
  parent_vhd_name: ubuntu-2204.vhdx
  vm_switch: External
  vm_vlan_id: 100
  ip_address: 192.168.1.50
  subnet: 255.255.255.0
  gateway: 192.168.1.1
  dns_servers:
    - 192.168.1.1
    - 8.8.8.8
```

### Additional disks

Each entry requires a `name`. `size_gb` defaults to `5`, and `type` defaults to
the driver's `disk_type`. Creation fails if a disk file of that name already
exists, so pick names unique to the suite.

```yaml
driver:
  name: hyperv
  parent_vhd_folder: C:\hyper-v\base-images
  parent_vhd_name: ubuntu-2204.vhdx
  additional_disks:
    - name: data
      size_gb: 20
    - name: logs
      size_gb: 10
      type: .vhdx
```

### Copying files into the guest

```yaml
driver:
  name: hyperv
  parent_vhd_folder: C:\hyper-v\base-images
  parent_vhd_name: windows-2022.vhdx
  enable_guest_services: true
  copy_vm_files:
    - source: C:\licenses\product.lic
      dest: C:\ProgramData\product.lic
```

### Remote Hyper-V server

```yaml
driver:
  name: hyperv
  hyperv_server: hyperv01.example.com
  hyperv_username: Administrator
  hyperv_password: <%= ENV['HYPERV_PASSWORD'] %>
  hyperv_ssl: true
  hyperv_insecure: false
  remote_vm_path: D:\Hyper-V
  parent_vhd_folder: D:\base-images
  parent_vhd_name: ubuntu-2204.vhdx
```

## Using with Chef

This driver is not tied to Cinc. The examples above use Cinc Workstation and the `cinc_infra` provisioner, but the driver works exactly the same with [Chef Workstation](https://www.chef.io/downloads/tools/workstation) — run `kitchen` instead of `cinc kitchen`, and use `chef_infra` instead of `cinc_infra`:

```yaml
provisioner:
  name: chef_infra

verifier:
  name: inspec
```

No driver configuration changes are needed.

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/test-kitchen/kitchen-hyperv). See [CONTRIBUTING.md](CONTRIBUTING.md) for development setup, how to run the tests, and the release process.

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
