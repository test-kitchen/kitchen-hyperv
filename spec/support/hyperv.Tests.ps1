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

