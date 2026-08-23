<#
.SYNOPSIS
    Loads support/hyperv.ps1 for testing, with mockable Hyper-V cmdlet shims.
.DESCRIPTION
    Dot-source this from each Describe block's BeforeAll:

        BeforeAll { . (Join-Path $PSScriptRoot 'TestHelper.ps1') }

    It must be dot-sourced inside the Describe, not at file level. Pester 5+
    resolves a function's callees in the scope the function was defined in, so a
    script dot-sourced at file level cannot see mocks registered further down.

    Two things happen here:

    1. test_modules is prepended to PSModulePath, so `#requires -Modules Hyper-V`
       and `Import-Module hyper-v` in hyperv.ps1 are satisfied off Windows.

    2. Every Hyper-V cmdlet the tests mock is redefined as a shim with untyped
       parameters. Pester builds CommandMetadata for a mocked command, which
       forces every parameter type to resolve -- and the real signatures name
       types such as [Microsoft.HyperV.PowerShell.VirtualMachine] that exist only
       on a Hyper-V host. Local functions shadow the module's, so the shims make
       these cmdlets mockable anywhere.

    The shims are never executed: each is mocked before any test calls it. They
    exist only to give Pester a signature it can reason about.
#>

$env:PSModulePath = (Join-Path $PSScriptRoot 'test_modules') +
    [IO.Path]::PathSeparator + $env:PSModulePath

. (Join-Path $PSScriptRoot '..' '..' 'support' 'hyperv.ps1')

function New-VHD {
    param($Path, $ParentPath, $SizeBytes, [switch]$Differencing)
}

function Get-VM {
    param([Parameter(ValueFromPipeline)]$InputObject, $Id, $Name)
}

function New-VM {
    param($Generation, $MemoryStartupBytes, $Name, $Path, $VHDPath, $SwitchName)
}

function Set-VM {
    param(
        [Parameter(ValueFromPipeline)]$VM,
        $Name,
        $ProcessorCount,
        $AutomaticCheckpointsEnabled,
        [switch]$PassThru
    )
}

function Set-VMMemory {
    param(
        [Parameter(ValueFromPipeline)]$VM,
        $DynamicMemoryEnabled,
        $MinimumBytes,
        $MaximumBytes
    )
}

function Start-VM {
    param([Parameter(ValueFromPipeline)]$VM, [switch]$PassThru)
}

function Stop-VM {
    param([Parameter(ValueFromPipeline)]$VM, [switch]$Force, [switch]$TurnOff, [switch]$PassThru)
}

function Remove-VM {
    param([Parameter(ValueFromPipeline)]$VM, [switch]$Force)
}

function Set-VMNetworkAdapter {
    param([Parameter(ValueFromPipeline)]$VM, $VMName, $StaticMacAddress)
}

function Set-VMNetworkAdapterVlan {
    param($VM, [switch]$Access, $VlanId)
}

function Add-VMHardDiskDrive {
    param($VM, $Path)
}

function Set-VMFirmware {
    param($VM, $EnableSecureBoot)
}

function Enable-VMIntegrationService {
    param($VM, $Name)
}

function Get-VMSwitch {
    param($Name)
}

# CimCmdlets ships only with Windows PowerShell, so these must be shimmed for
# the suite to run anywhere.
function Get-CimInstance {
    param([Parameter(ValueFromPipeline)]$InputObject, $Namespace, $ClassName, $Filter)
}

function Get-CimAssociatedInstance {
    param([Parameter(ValueFromPipeline)]$InputObject, $ResultClassName)
}

function Invoke-CimMethod {
    param([Parameter(ValueFromPipeline)]$InputObject, $MethodName, $Arguments)
}

function Add-VMDvdDrive {
    param([Parameter(ValueFromPipeline, Position = 0)]$VMName)
}

function Set-VMDvdDrive {
    param([Parameter(ValueFromPipeline)]$InputObject, $VMName, $Path)
}
