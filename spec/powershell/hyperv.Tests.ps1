#
# Pester tests for support/hyperv.ps1.
#
# These run on any platform: spec/powershell/test_modules holds a stub Hyper-V
# module supplying the cmdlet signatures, and TestHelper.ps1 shims every cmdlet
# that would otherwise touch a real hypervisor.
#
# Run with: bundle exec rake pester
#
# Three Pester 5+ rules shape this file. Each one silently produces tests that
# pass no matter what the code does if ignored:
#
#   * TestHelper.ps1 is dot-sourced in every Describe's BeforeAll, not once at
#     file level. A function resolves its callees in the scope it was defined
#     in, so a file-level dot-source cannot see mocks registered further down.
#
#   * The call under test happens inside the It, never in a BeforeAll.
#     `Should -Invoke` defaults to `-Scope It` and counts only invocations made
#     within the same It block.
#
#   * `-Times N` means "at least N", so `-Times 0` alone can never fail. Every
#     assertion that a cmdlet was NOT called uses `-Exactly`.

Describe 'New-DifferencingDisk' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'TestHelper.ps1')
        Mock New-VHD
    }

    Context 'parameter contract' {
        It 'requires Path' {
            (Get-Command New-DifferencingDisk).Parameters['Path'].Attributes.Mandatory |
                Should -Contain $true
        }

        It 'requires ParentPath' {
            (Get-Command New-DifferencingDisk).Parameters['ParentPath'].Attributes.Mandatory |
                Should -Contain $true
        }
    }

    It 'leaves an existing differencing disk alone' {
        Mock Test-Path { $true }

        New-DifferencingDisk -Path 'c:\.kitchen\diff.vhd' -ParentPath 'c:\source.vhd'

        Should -Invoke New-VHD -Exactly -Times 0
    }

    It 'creates a differencing disk from the parent when none exists' {
        Mock Test-Path { $false }

        New-DifferencingDisk -Path 'c:\.kitchen\diff.vhd' -ParentPath 'c:\source.vhd'

        Should -Invoke New-VHD -Exactly -Times 1 -ParameterFilter {
            $Path -eq 'c:\.kitchen\diff.vhd' -and
            $ParentPath -eq 'c:\source.vhd' -and
            $Differencing -eq $true
        }
    }
}

Describe 'Assert-VmRunning' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'TestHelper.ps1')
        Mock Get-VM
        Mock Start-VM
    }

    It 'returns an empty placeholder when no id is supplied' {
        $result = Assert-VmRunning -Id ''

        $result.Name | Should -BeNullOrEmpty
        $result.State | Should -BeNullOrEmpty
        Should -Invoke Get-VM -Exactly -Times 0
    }

    It 'leaves an already running VM alone' {
        Mock Get-VM { [pscustomobject]@{ Name = 'kitchen'; Id = 'vm-1'; State = 'Running' } }

        $result = Assert-VmRunning -Id 'vm-1'

        Should -Invoke Start-VM -Exactly -Times 0
        $result.Id | Should -Be 'vm-1'
        $result.State | Should -Be 'Running'
    }

    It 'starts a stopped VM and returns it running' {
        Mock Get-VM { [pscustomobject]@{ Name = 'kitchen'; Id = 'vm-1'; State = 'Off' } }
        Mock Start-VM { [pscustomobject]@{ Name = 'kitchen'; Id = 'vm-1'; State = 'Running' } }

        $result = Assert-VmRunning -Id 'vm-1'

        Should -Invoke Start-VM -Exactly -Times 1
        $result.State | Should -Be 'Running'
    }
}

Describe 'New-KitchenVM' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'TestHelper.ps1')

        # New-VM and Set-VM -PassThru return the VM object the rest of the
        # function pipes into. Returning nothing would leave $vm null, and
        # `$null | Set-VMMemory` never invokes the cmdlet at all -- so the
        # later assertions would pass without the code doing anything.
        $vmObject = [pscustomobject]@{ VMName = 'kitchen'; Id = 'vm-0001'; State = 'Running' }
        Mock New-VM { $vmObject }
        Mock Set-VM { $vmObject }
        Mock Set-VMMemory
        Mock Start-VM
        Mock Set-VMNetworkAdapter
        Mock Set-VMNetworkAdapterVlan
        Mock Add-VMHardDiskDrive
        Mock Set-VMFirmware
        Mock Enable-VMIntegrationService
        Mock Mount-VMISO
    }

    Context 'core VM settings' {
        It 'passes the configured hardware through to New-VM' {
            New-KitchenVM -Name 'kitchen' -Generation 2 -MemoryStartupBytes 2GB `
                -Path 'C:\vms' -VHDPath 'C:\vms\diff.vhdx' -SwitchName 'External'

            Should -Invoke New-VM -Exactly -Times 1 -ParameterFilter {
                $Name -eq 'kitchen' -and
                $Generation -eq 2 -and
                $MemoryStartupBytes -eq 2GB -and
                $SwitchName -eq 'External'
            }
        }

        It 'strips the parameters New-VM does not understand' {
            New-KitchenVM -ProcessorCount 8 -UseDynamicMemory 'false' -EnableGuestServices 'false'

            Should -Invoke New-VM -Exactly -Times 1 -ParameterFilter {
                -not $PSBoundParameters.ContainsKey('ProcessorCount') -and
                -not $PSBoundParameters.ContainsKey('UseDynamicMemory') -and
                -not $PSBoundParameters.ContainsKey('EnableGuestServices')
            }
        }

        It 'applies the processor count through Set-VM instead' {
            New-KitchenVM -ProcessorCount 8

            Should -Invoke Set-VM -Exactly -Times 1 -ParameterFilter { $ProcessorCount -eq 8 }
        }

        It 'starts the VM' {
            New-KitchenVM

            Should -Invoke Start-VM -Exactly -Times 1
        }
    }

    Context 'VlanId' {
        It 'is left untouched when none is given' {
            New-KitchenVM

            Should -Invoke Set-VMNetworkAdapterVlan -Exactly -Times 0
        }

        It 'is set in access mode when given' {
            New-KitchenVM -VlanId 42

            Should -Invoke Set-VMNetworkAdapterVlan -Exactly -Times 1 -ParameterFilter {
                $Access -eq $true -and $VlanId -eq 42
            }
        }
    }

    Context 'AdditionalDisks' {
        It 'attaches nothing when none are given' {
            New-KitchenVM

            Should -Invoke Add-VMHardDiskDrive -Exactly -Times 0
        }

        It 'attaches one drive per disk' {
            New-KitchenVM -AdditionalDisks @('.\data.vhdx', '.\logs.vhdx')

            Should -Invoke Add-VMHardDiskDrive -Exactly -Times 2
            Should -Invoke Add-VMHardDiskDrive -Exactly -Times 1 -ParameterFilter {
                $Path -eq '.\data.vhdx'
            }
            Should -Invoke Add-VMHardDiskDrive -Exactly -Times 1 -ParameterFilter {
                $Path -eq '.\logs.vhdx'
            }
        }
    }

    Context 'DisableSecureBoot' {
        It 'leaves firmware alone by default' {
            New-KitchenVM

            Should -Invoke Set-VMFirmware -Exactly -Times 0
        }

        It 'leaves firmware alone when explicitly false' {
            New-KitchenVM -DisableSecureBoot $false

            Should -Invoke Set-VMFirmware -Exactly -Times 0
        }

        It 'leaves firmware alone on generation 1, which has no secure boot' {
            New-KitchenVM -Generation 1 -DisableSecureBoot $true

            Should -Invoke Set-VMFirmware -Exactly -Times 0
        }

        It 'turns secure boot off on generation 2' {
            New-KitchenVM -Generation 2 -DisableSecureBoot $true

            Should -Invoke Set-VMFirmware -Exactly -Times 1 -ParameterFilter {
                $EnableSecureBoot -eq 'Off'
            }
        }

        It 'accepts the quoted boolean the driver interpolates into the script' {
            New-KitchenVM -Generation 2 -DisableSecureBoot 'true'

            Should -Invoke Set-VMFirmware -Exactly -Times 1
        }
    }

    Context 'StaticMacAddress' {
        It 'is skipped when the driver passes an empty string' {
            New-KitchenVM -StaticMacAddress ''

            Should -Invoke Set-VMNetworkAdapter -Exactly -Times 0
        }

        It 'is applied when an address is given' {
            New-KitchenVM -StaticMacAddress '00155D01B532'

            Should -Invoke Set-VMNetworkAdapter -Exactly -Times 1 -ParameterFilter {
                $VMName -eq 'kitchen' -and $StaticMacAddress -eq '00155D01B532'
            }
        }
    }

    Context 'memory' {
        It 'uses static memory by default' {
            New-KitchenVM

            Should -Invoke Set-VMMemory -Exactly -Times 1 -ParameterFilter {
                $DynamicMemoryEnabled -eq $false
            }
        }

        It 'uses dynamic memory with the configured bounds when requested' {
            New-KitchenVM -UseDynamicMemory 'true' -DynamicMemoryMinBytes 1GB -DynamicMemoryMaxBytes 4GB

            Should -Invoke Set-VMMemory -Exactly -Times 1 -ParameterFilter {
                $DynamicMemoryEnabled -eq $true -and
                $MinimumBytes -eq 1GB -and
                $MaximumBytes -eq 4GB
            }
        }
    }

    Context 'guest services' {
        It 'stay off by default' {
            New-KitchenVM

            Should -Invoke Enable-VMIntegrationService -Exactly -Times 0
        }

        It 'are enabled when requested' {
            New-KitchenVM -EnableGuestServices 'true'

            Should -Invoke Enable-VMIntegrationService -Exactly -Times 1 -ParameterFilter {
                $Name -eq 'Guest Service Interface'
            }
        }
    }

    Context 'boot ISO' {
        It 'is not mounted when no path is given' {
            New-KitchenVM

            Should -Invoke Mount-VMISO -Exactly -Times 0
        }

        It 'is mounted when a path is given' {
            New-KitchenVM -boot_iso_path 'C:\iso\boot.iso'

            Should -Invoke Mount-VMISO -Exactly -Times 1 -ParameterFilter {
                $Path -eq 'C:\iso\boot.iso'
            }
        }
    }

    Context 'automatic checkpoints' {
        It 'are turned off on hosts whose Set-VM supports them' {
            Mock Get-Command { @{ Parameters = @{ AutomaticCheckpointsEnabled = 'dummy' } } } `
                -ParameterFilter { $Name -eq 'Set-VM' }

            New-KitchenVM

            Should -Invoke Set-VM -Exactly -Times 1 -ParameterFilter {
                $AutomaticCheckpointsEnabled -eq $false
            }
        }

        It 'are left alone on hosts whose Set-VM does not support them' {
            Mock Get-Command { @{ Parameters = @{} } } -ParameterFilter { $Name -eq 'Set-VM' }

            New-KitchenVM

            Should -Invoke Set-VM -Exactly -Times 0 -ParameterFilter {
                $AutomaticCheckpointsEnabled -eq $false
            }
        }
    }
}

Describe 'Get-DefaultVMSwitch' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'TestHelper.ps1')
        Mock Get-VMSwitch {
            [pscustomobject]@{ Name = 'Default Switch'; Id = 'sw-1' }
            [pscustomobject]@{ Name = 'External'; Id = 'sw-2' }
        }
    }

    It 'returns only the first switch, so the driver gets exactly one name' {
        $result = Get-DefaultVMSwitch

        @($result).Count | Should -Be 1
        $result.Name | Should -Be 'Default Switch'
    }

    It 'passes a requested name through to Get-VMSwitch' {
        Get-DefaultVMSwitch -Name 'External'

        Should -Invoke Get-VMSwitch -Exactly -Times 1 -ParameterFilter { $Name -eq 'External' }
    }
}

Describe 'Mount-VMISO' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'TestHelper.ps1')
        Mock Add-VMDvdDrive
        Mock Set-VMDvdDrive
    }

    It 'uses the DVD drive a generation 1 VM already has' {
        Mock Get-VM { [pscustomobject]@{ Name = 'kitchen'; Generation = 1 } }

        Mount-VMISO -Id 'vm-1' -Path 'C:\iso\tools.iso'

        Should -Invoke Add-VMDvdDrive -Exactly -Times 0
        Should -Invoke Set-VMDvdDrive -Exactly -Times 1 -ParameterFilter {
            $Path -eq 'C:\iso\tools.iso'
        }
    }

    It 'adds a DVD drive first on a generation 2 VM, which has none' {
        Mock Get-VM { [pscustomobject]@{ Name = 'kitchen'; Generation = 2 } }

        Mount-VMISO -Id 'vm-1' -Path 'C:\iso\tools.iso'

        Should -Invoke Add-VMDvdDrive -Exactly -Times 1
    }
}

Describe 'Get-VmDetail' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'TestHelper.ps1')
    }

    It 'reports the name, id and address the driver stores in state' {
        Mock Get-VM { [pscustomobject]@{ Name = 'kitchen'; ID = 'vm-1' } }
        Mock Get-VmIP { '192.168.1.50' }

        $detail = Get-VmDetail -Id 'vm-1'

        $detail.Name | Should -Be 'kitchen'
        $detail.Id | Should -Be 'vm-1'
        $detail.IpAddress | Should -Be '192.168.1.50'
    }
}
