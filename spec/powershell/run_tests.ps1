#Requires -Version 7.0
<#
.SYNOPSIS
    Runs the Pester tests for support/hyperv.ps1.
.DESCRIPTION
    Invoked by `bundle exec rake pester`. Exits non-zero if any test fails so
    the rake task fails with it.
#>
[CmdletBinding()]
param(
    # Emit an NUnit XML report at this path, for CI test reporting.
    [string]$ResultsPath
)

$ErrorActionPreference = 'Stop'

$pester = Get-Module -ListAvailable -Name Pester |
    Where-Object { $_.Version -ge [version]'5.0.0' } |
    Sort-Object Version -Descending |
    Select-Object -First 1

if (-not $pester) {
    throw "Pester 5 or newer is required. Install it with: Install-Module Pester -Scope CurrentUser -Force -SkipPublisherCheck"
}

Import-Module $pester -Force

$config = New-PesterConfiguration
$config.Run.Path = $PSScriptRoot
$config.Run.Exit = $true
$config.Output.Verbosity = 'Detailed'

if ($ResultsPath) {
    $config.TestResult.Enabled = $true
    $config.TestResult.OutputPath = $ResultsPath
}

Invoke-Pester -Configuration $config
