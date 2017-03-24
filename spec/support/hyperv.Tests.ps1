. $PSScriptRoot\..\..\support\hyperv.ps1

describe 'New-DifferencingDisk' {
    mock new-vhd -Verifiable -MockWith {}

    context 'mandatory parameters' {
        mock Test-Path -MockWith {}

        $command = get-command new-differencingDisk

        it 'Path is mandatory' {
            $Command.Parameters['Path'].Attributes.Mandatory | should be $true
        }
        it 'ParentPath is mandatory' {
            $Command.Parameters['ParentPath'].Attributes.Mandatory | should be $true
        }
    }

    context 'when differencing disk exists' {
        mock Test-Path -ParameterFilter {$Path -eq 'c:\.kitchen\diff.vhd'} -MockWith {$true}

        new-differencingDisk -Path 'c:\.kitchen\diff.vhd' -parentpath 'c:\source.vhd'

        it 'does not create a new vhd' {
            Assert-MockCalled new-vhd -Times 0
        }
    }

    context 'when a differencing disk does not exist' {
        mock Test-Path -ParameterFilter {$Path -eq 'c:\.kitchen\diff.vhd'} -MockWith {$false}

        new-differencingDisk -Path 'c:\.kitchen\diff.vhd' -parentpath 'c:\source.vhd'

        it 'creates a new differencing disk' {
            Assert-MockCalled new-vhd -Times 1 -ParameterFilter {
                $Path -eq 'c:\.kitchen\diff.vhd' -and 
                $ParentPath -eq 'c:\source.vhd' -and 
                $Differencing -eq $true
            }
        }
    }
}

Describe "New-KitchenVM with VlanId" {
    function New-VM {}
    function Set-VM {}
    function Set-VMMemory {}
    function Set-VMNetworkAdapterVlan {param ($VM, [Switch]$Access, $VlanId)}
    function Start-VM {}
  
    Mock New-VM
    Mock Set-VM
    Mock Set-VMMemory
    Mock Set-VMNetworkAdapterVlan
    Mock Start-VM

    Context "When VlanId is not specified" {
        New-KitchenVM

        It "Should not set the VlanId for the VM" {
            Assert-MockCalled Set-VMNetworkAdapterVlan -Times 0
        }
    }

    Context "When VlanId is specified" {
        $testVlanId = 1
        New-KitchenVM -VlanId $testVlanId

        It "Should set the VlanId for the VM" {
            Assert-MockCalled Set-VMNetworkAdapterVlan -Times 1 -ParameterFilter {
                $VM -eq $null -and 
                $Access -eq $true -and 
                $VlanId -eq $testVlanId
            }
        }
    }
}

Describe "New-KitchenVM with AdditionalDisks" {
    function New-VM {}
    function Set-VM {}
    function Set-VMMemory {}
    function Add-VMHardDiskDrive {param ($Path)}
    function Start-VM {}
  
    Mock New-VM
    Mock Set-VM
    Mock Set-VMMemory
    Mock Add-VMHardDiskDrive
    Mock Start-VM

    Context "When AdditionalDisks is not specified" {
        New-KitchenVM

        It "Should not add additional disks to the VM" {
            Assert-MockCalled Add-VMHardDiskDrive -Times 0
        }
    }

    Context "When AdditionalDisks is specified" {
        $AdditionalDisks = @(".\test1.vhd", ".\test2.vhdx")
        New-KitchenVM -AdditionalDisks $AdditionalDisks

        It "Should add additinoal disks to the VM" {
            Assert-MockCalled Add-VMHardDiskDrive -Times $AdditionalDisks.Count -ParameterFilter {
                $VM -eq $null -and 
                $Path -in $AdditionalDisks
            }
        }
    }
}

Describe "New-KitchenVM with DisableSecureBoot" {
    function New-VM {}
    function Set-VM {}
    function Set-VMMemory {}
    function Set-VMFirmware {param ($EnableSecureBoot)}
    function Start-VM {}
  
    Mock New-VM
    Mock Set-VM
    Mock Set-VMMemory
    Mock Set-VMFirmware
    Mock Start-VM

    Context "When DisableSecureBoot is not specified" {
        New-KitchenVM

        It "Should not set firmware settings on the VM" {
            Assert-MockCalled Set-VMFirmware -Times 0
        }
    }

    Context "When DisableSecureBoot is False" {
        New-KitchenVM -DisableSecureBoot $false

        It "Should not set firmware settings on the VM" {
            Assert-MockCalled Set-VMFirmware -Times 0
        }
    }

    Context "When DisableSecureBoot is True and Generation is 1" {
        New-KitchenVM -Generation 1 -DisableSecureBoot $true

        It "Should not set firmware settings on the VM" {
            Assert-MockCalled Set-VMFirmware -Times 0
        }
    }

    Context "When DisableSecureBoot is True and Generation is 2" {
        New-KitchenVM -Generation 2 -DisableSecureBoot $true

        It "Should disable secure boot on the VM" {
            Assert-MockCalled Set-VMFirmware -Times 1 -ParameterFilter {
                $VM -eq $null -and 
                $EnableSecureBoot -eq "Off"
            }
        }
    }
}
