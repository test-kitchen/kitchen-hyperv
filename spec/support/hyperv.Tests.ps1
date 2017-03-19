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