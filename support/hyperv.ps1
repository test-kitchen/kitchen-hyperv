
$ProgressPreference = "SilentlyContinue"

<<<<<<< HEAD:lib/kitchen/support/hyperv.ps1
function new-differencingdisk
=======
function New-DifferencingDisk
>>>>>>> rubocop'd and some tests:support/hyperv.ps1
{
	[cmdletbinding()]
	param ([string[]]$Path, [string]$ParentPath)
	if (-not (test-path $Path))
    {
      $null = new-vhd @psboundparameters -Differencing
    }
}

function Assert-VmRunning
{
	[cmdletbinding()]
	param([string]$Id)

    if ([string]::IsNullOrEmpty($ID))
    {
      $Output = [pscustomobject]@{Name = '';State =''}
    }
    else
    {
      $Output = Get-VM -Id $ID |
        foreach {
          if ($_.State -notlike 'Running')
          {
            $_ | start-vm -passthru
          }
          else
          {
            $_
          }
        } |
        select Name, Id, State
    }
    $output
}

function New-KitchenVM
{
	[cmdletbinding()]
	param (
        $Generation = 1,
	    $MemoryStartupBytes,
	    $Name,
	    $Path,
	    $VHDPath,
	    $SwitchName,
	    $ProcessorCount
	  )
	  $null = $psboundparameters.remove('ProcessorCount')
	  new-vm @psboundparameters |
	    Set-Vm -ProcessorCount $ProcessorCount -passthru |
	    Start-Vm -passthru |
	    foreach {
	      $vm = $_
	      do {
	        start-sleep -seconds 2
	      } while ($vm.state -notlike 'Running')
	      $vm
	    } |
	    select Name, Id, State
}

function Get-VmIP($vm)
{
	$vm.networkadapters.ipaddresses |
	  where {$_ -match '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$'} |
	  select -first 1
}

Function Set-VMNetworkConfiguration
{
    [CmdletBinding()]
    Param (
        [parameter(valuefrompipeline)]
        [object]$NetworkAdapter,
        [String[]]$IPAddress=@(),
        [String[]]$Subnet=@()
    )

    $VM = Get-WmiObject -Namespace 'root\virtualization\v2' -Class 'Msvm_ComputerSystem' | Where-Object { $_.ElementName -eq $NetworkAdapter.VMName }
    $VMSettings = $vm.GetRelated('Msvm_VirtualSystemSettingData') | Where-Object { $_.VirtualSystemType -eq 'Microsoft:Hyper-V:System:Realized' }
    $VMNetAdapters = $VMSettings.GetRelated('Msvm_SyntheticEthernetPortSettingData')

    $NetworkSettings = @()
    foreach ($NetAdapter in $VMNetAdapters) {
        if ($NetAdapter.Address -eq $NetworkAdapter.MacAddress) {
            $NetworkSettings = $NetworkSettings + $NetAdapter.GetRelated("Msvm_GuestNetworkAdapterConfiguration")
        }
    }

    $NetworkSettings[0].IPAddresses = $IPAddress
    $NetworkSettings[0].Subnets = $Subnet
    $NetworkSettings[0].ProtocolIFType = 4096
    $NetworkSettings[0].DHCPEnabled = $false


    $Service = Get-WmiObject -Class "Msvm_VirtualSystemManagementService" -Namespace "root\virtualization\v2"
    $setIP = $Service.SetGuestNetworkAdapterConfiguration($VM, $NetworkSettings[0].GetText(1))

    if ($setip.ReturnValue -eq 4096) {
        $job=[WMI]$setip.job

        while ($job.JobState -eq 3 -or $job.JobState -eq 4) {
            start-sleep 1
            $job=[WMI]$setip.job
        }

        if ($job.JobState -ne 7) {
            $job.GetError()
        }
    }
    (Get-VM -id $NetworkAdapter.VmId).NetworkAdapter | select Name, IpAddress
}

function Get-VmDetail
{
	[cmdletbinding()]
	param($Id)

	get-vm -id $Id |
	    foreach {
	      $vm = $_
	      do {
	        start-sleep -seconds 1
	      } while (-not (Get-VmIP $vm))

	      [pscustomobject]@{
	        Name = $vm.name
	        Id = $vm.ID
	        IpAddress = (Get-VmIP $vm)
	      }
	    }
<<<<<<< HEAD:lib/kitchen/support/hyperv.ps1
=======
}

function Get-DefaultVMSwitch
{
    Get-VMSwitch | Select -First 1 
>>>>>>> rubocop'd and some tests:support/hyperv.ps1
}