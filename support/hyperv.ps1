#requires -Version 2 -Modules Hyper-V

#implicitly import hyperv module to avoid powercli cmdlets
if ((Get-Module -Name 'hyper-v') -ne $null) {
    Remove-Module -Name hyper-v
    Import-Module -Name hyper-v
}
else {
    Import-Module -Name hyper-v
}

$ProgressPreference = 'SilentlyContinue'


function New-DifferencingDisk {
    [cmdletbinding()]
    param (
        [parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]]$Path,
        [parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ParentPath
    )
    if (-not (Test-Path $Path)) {
        $null = new-vhd @psboundparameters -Differencing
    }
}

function Assert-VmRunning {
    [cmdletbinding()]
    param([string]$Id)

    if ([string]::IsNullOrEmpty($Id)) {
        $Output = [pscustomobject]@{
            Name = ''
            State = ''
        }
    }
    else {
        $Output = Get-VM -Id $Id |
            ForEach-Object -Process {
            if ($_.State -notlike 'Running') {
                $_ |
                    Start-VM -passthru
            }
            else {
                $_
            }
        } |
            Select-Object -Property Name, Id, State
    }
    $Output
}

function New-KitchenVM {
    [cmdletbinding()]
    param (
        $Generation = 1,
        $DisableSecureBoot,
        $MemoryStartupBytes,
        $StaticMacAddress,
        $Name,
        $Path,
        $VHDPath,
        $SwitchName,
        $VlanId,
        $ProcessorCount,
        $UseDynamicMemory,
        $DynamicMemoryMinBytes,
        $DynamicMemoryMaxBytes,
        $boot_iso_path,
        $EnableGuestServices,
        $AdditionalDisks
    )
    $null = $psboundparameters.remove('DisableSecureBoot')
    $null = $psboundparameters.remove('ProcessorCount')
    $null = $psboundparameters.remove('StaticMacAddress')
    $null = $psboundparameters.remove('UseDynamicMemory')
    $null = $psboundparameters.remove('DynamicMemoryMinBytes')
    $null = $psboundparameters.remove('DynamicMemoryMaxBytes')
    $null = $psboundparameters.remove('boot_iso_path')
    $null = $psboundparameters.remove('EnableGuestServices')
    $null = $psboundparameters.remove('VlanId')
    $null = $psboundparameters.remove('AdditionalDisks')
    $DisableSecureBoot = [Convert]::ToBoolean($DisableSecureBoot)
    $UseDynamicMemory = [Convert]::ToBoolean($UseDynamicMemory)
    $null = [bool]::TryParse($EnableGuestServices, [ref]$EnableGuestServices)

    $vm = new-vm @psboundparameters |
        Set-Vm -ProcessorCount $ProcessorCount -passthru

    if ($UseDynamicMemory) {
        $vm | Set-VMMemory -DynamicMemoryEnabled $true -MinimumBytes $DynamicMemoryMinBytes -MaximumBytes $DynamicMemoryMaxBytes
    }
    else {
        $vm | Set-VMMemory -DynamicMemoryEnabled $false
    }
    if (-not [string]::IsNullOrEmpty($boot_iso_path)) {
        Mount-VMISO -Id $vm.Id -Path $boot_iso_path
    }
    if (-not [string]::IsNullOrEmpty($StaticMacAddress)) {
        Set-VMNetworkAdapter -VMName $vm.VMName -StaticMacAddress $StaticMacAddress
    }
    if ($EnableGuestServices -and (Get-command Enable-VMIntegrationService -ErrorAction SilentlyContinue)) {
        Enable-VMIntegrationService -VM $vm -Name 'Guest Service Interface'
    }
    if (($VlanId -ne $null) -and (Get-command Set-VMNetworkAdapterVlan -ErrorAction SilentlyContinue)) {
        Set-VMNetworkAdapterVlan -VM $vm -Access -VlanId $VlanId
    }
    if ($AdditionalDisks -and (Get-command Add-VMHardDiskDrive -ErrorAction SilentlyContinue)) {
        foreach ($AdditionalDisk in $AdditionalDisks) {
            Add-VMHardDiskDrive -VM $vm -Path $AdditionalDisk
        }
    }
    if ($DisableSecureBoot -and ($Generation -eq 2) -and (Get-command Set-VMFirmware -ErrorAction SilentlyContinue)) {
        Set-VMFirmware -VM $vm -EnableSecureBoot Off
    }
    if ((Get-Command -Name Set-Vm).Parameters["AutomaticCheckpointsEnabled"]) {
        Set-VM -Name $vm.VMName -AutomaticCheckpointsEnabled $false
    }
    $vm | Start-Vm -passthru |
        foreach {
        $vm = $_
        do {
            start-sleep -seconds 2
        }
        while ($vm.state -notlike 'Running')
        $vm
    } |
        select Name, Id, State
}

function Get-VmIP($vm) {
    start-sleep -seconds 10
    $vm.networkadapters.ipaddresses |
        Where-Object {
        $_ -match '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$'
    } |
        Select-Object -First 1
}

Function Set-VMNetworkConfiguration {
    [CmdletBinding()]
    Param (
        [parameter(valuefrompipeline)]
        [object]$NetworkAdapter,
        [String[]]$IPAddress = @(),
        [String[]]$Gateway = @(),
        [String[]]$DNSServers = @(),
        [String[]]$Subnet = @()
    )

    $vm = Get-CimInstance -Namespace 'root\virtualization\v2' -ClassName 'Msvm_ComputerSystem' -Filter "ElementName = '$($NetworkAdapter.VMName)'"

    $VMSettings = Get-CimAssociatedInstance -InputObject $vm -ResultClassName 'Msvm_VirtualSystemSettingData' |
        Where-Object { $_.VirtualSystemType -eq 'Microsoft:Hyper-V:System:Realized' }

    $VMNetAdapters = Get-CimAssociatedInstance -InputObject $VMSettings -ResultClassName 'Msvm_SyntheticEthernetPortSettingData'

    $NetworkSettings = @()
    foreach ($NetAdapter in $VMNetAdapters) {
        if ($NetAdapter.Address -eq $NetworkAdapter.MacAddress) {
            $NetworkSettings += Get-CimAssociatedInstance -InputObject $NetAdapter -ResultClassName 'Msvm_GuestNetworkAdapterConfiguration'
        }
    }

    if ($NetworkSettings.Count -eq 0) {
        throw "No guest network adapter configuration found for MAC address $($NetworkAdapter.MacAddress) on VM $($NetworkAdapter.VMName)."
    }

    $NetworkSettings[0].IPAddresses = $IPAddress
    $NetworkSettings[0].DefaultGateways = $Gateway
    $NetworkSettings[0].DNSServers = $DNSServers
    $NetworkSettings[0].Subnets = $Subnet
    $NetworkSettings[0].ProtocolIFType = 4096
    $NetworkSettings[0].DHCPEnabled = $false


    $Service = Get-CimInstance -Namespace 'root\virtualization\v2' -ClassName 'Msvm_VirtualSystemManagementService'

    # NetworkConfiguration is declared string[] of embedded instances; the CIM
    # layer serializes the CimInstance for us, replacing WMI's GetText(1).
    $setIP = Invoke-CimMethod -InputObject $Service -MethodName 'SetGuestNetworkAdapterConfiguration' -Arguments @{
        ComputerSystem       = $vm
        NetworkConfiguration = @($NetworkSettings[0])
    }

    # 4096 means the method was accepted and is running as a job.
    if ($setIP.ReturnValue -eq 4096) {
        $job = $setIP.Job | Get-CimInstance

        # 3 = Starting, 4 = Running.
        while ($job.JobState -eq 3 -or $job.JobState -eq 4) {
            Start-Sleep -Seconds 1
            $job = $job | Get-CimInstance
        }

        # 7 = Completed. Anything else previously emitted the error and carried
        # on, which hid a failed address assignment behind a successful create.
        if ($job.JobState -ne 7) {
            throw "Setting the guest network adapter configuration failed: $($job.ErrorDescription)"
        }
    }
    elseif ($setIP.ReturnValue -ne 0) {
        throw "Setting the guest network adapter configuration failed with return value $($setIP.ReturnValue)."
    }

    (Get-VM -Id $NetworkAdapter.VmId).NetworkAdapters | Select-Object Name, IPAddresses
}

function Get-VmDetail {
    [cmdletbinding()]
    param(
        $Id,

        # Longest to wait for the guest to report an IPv4 address. Without a
        # bound, a VM whose network never comes up leaves `kitchen create`
        # hanging silently for as long as the user is willing to wait.
        [int]$TimeoutSeconds = 600
    )

    Get-VM -Id $Id |
        ForEach-Object {
        $vm = $_
        $deadline = (Get-Date).AddSeconds($TimeoutSeconds)

        # Keep the address the wait found rather than asking again: Get-VmIP
        # sleeps 10 seconds per call, so a second call cost every create an
        # extra 10 seconds and could return a different adapter's address.
        $ipAddress = Get-VmIP $vm

        while (-not $ipAddress) {
            if ((Get-Date) -gt $deadline) {
                throw "Timed out after $TimeoutSeconds seconds waiting for virtual machine '$($vm.Name)' to report an IP address. Check that the VM booted and that its network adapter is connected to a switch with DHCP."
            }
            Start-Sleep -Seconds 1
            $ipAddress = Get-VmIP $vm
        }

        [pscustomobject]@{
            Name = $vm.name
            Id = $vm.ID
            IpAddress = $ipAddress
        }
    }
}

function Get-VmStatus {
    [cmdletbinding()]
    param($Id)

    Get-VM -Id $Id -ErrorAction SilentlyContinue |
        ForEach-Object {
        [pscustomobject]@{
            Name  = $_.Name
            Id    = [string]$_.Id
            State = [string]$_.State
        }
    }
}

function Get-DefaultVMSwitch {
    [CmdletBinding()]
    param ($Name)
    Get-VMSwitch @PSBoundParameters |
        Select-Object -First 1 |
        Select-Object Name, Id
}

function Mount-VMISO {
    [cmdletbinding()]
    param($Id, $Path)

    if ((Get-VM -Id $Id).Generation -eq 2) {
        Add-VMDvdDrive (Get-VM -Id $Id).Name | Set-VMDvdDrive -VMName (Get-VM -Id $Id).Name -Path $Path
    }

    Set-VMDvdDrive -VMName (Get-VM -Id $Id).Name -Path $Path
}

