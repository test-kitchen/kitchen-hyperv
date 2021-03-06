
function Add-VMAssignableDevice {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [ValidateNotNullOrEmpty()]
    [string]
    ${InstancePath},

    [ValidateNotNullOrEmpty()]
    [string]
    ${LocationPath},

    [System.Nullable[uint16]]
    ${VirtualFunction},

    [ValidateNotNull()]
    [string]
    ${ResourcePoolName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMDvdDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMDriveController[]]
    ${VMDriveController},

    [Parameter(ParameterSetName='VMName', Position=2)]
    [Parameter(ParameterSetName='VMObject', Position=2)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(Position=3)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [Parameter(Position=4)]
    [string]
    ${Path},

    [ValidateNotNull()]
    [string]
    ${ResourcePoolName},

    [switch]
    ${AllowUnverifiedPaths},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMFibreChannelHba {
[CmdletBinding(DefaultParameterSetName='VMName and GenerateWwn', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName and GenerateWwn')]
    [Parameter(ParameterSetName='VMName and manual WWN')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName and GenerateWwn')]
    [Parameter(ParameterSetName='VMName and manual WWN')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName and GenerateWwn')]
    [Parameter(ParameterSetName='VMName and manual WWN')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VM object and GenerateWwn', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName and GenerateWwn', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SanName},

    [Parameter(ParameterSetName='VMName and GenerateWwn')]
    [Parameter(ParameterSetName='VM object and GenerateWwn')]
    [switch]
    ${GenerateWwn},

    [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true)]
    [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true)]
    [Alias('Wwnn1')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWideNodeNameSetA},

    [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true)]
    [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true)]
    [Alias('Wwpn1')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWidePortNameSetA},

    [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true)]
    [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true)]
    [Alias('Wwnn2')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWideNodeNameSetB},

    [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true)]
    [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true)]
    [Alias('Wwpn2')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWidePortNameSetB},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMGpuPartitionAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MinPartitionVRAM},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MaxPartitionVRAM},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${OptimalPartitionVRAM},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MinPartitionEncode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MaxPartitionEncode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${OptimalPartitionEncode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MinPartitionDecode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MaxPartitionDecode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${OptimalPartitionDecode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MinPartitionCompute},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MaxPartitionCompute},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${OptimalPartitionCompute})

process {throw "Should not be called."}}


function Add-VMGroupMember {
[CmdletBinding(DefaultParameterSetName='VM Using Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMGroup Using ID')]
    [Parameter(ParameterSetName='VM Using Name')]
    [Parameter(ParameterSetName='VMGroup Using Name')]
    [Parameter(ParameterSetName='VM Using ID')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VM Using Name')]
    [Parameter(ParameterSetName='VMGroup Using Name')]
    [Parameter(ParameterSetName='VM Using ID')]
    [Parameter(ParameterSetName='VMGroup Using ID')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VM Using ID')]
    [Parameter(ParameterSetName='VM Using Name')]
    [Parameter(ParameterSetName='VMGroup Using Name')]
    [Parameter(ParameterSetName='VMGroup Using ID')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMGroup Using Name', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VM Using Name', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='VM Using ID', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VMGroup Using ID', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [guid]
    ${Id},

    [Parameter(ParameterSetName='VMGroup Using InputObject', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VM Using InputObject', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMGroup]
    ${VMGroup},

    [Parameter(ParameterSetName='VM Using InputObject', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VM Using Name', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VM Using ID', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMGroup Using Name', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMGroup Using ID', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMGroup Using InputObject', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMGroup[]]
    ${VMGroupMember},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMHardDiskDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Alias('PSComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMDriveController]
    ${VMDriveController},

    [Parameter(ParameterSetName='VMObject', Position=1)]
    [Parameter(ParameterSetName='VMName', Position=1)]
    [System.Nullable[Microsoft.HyperV.PowerShell.ControllerType]]
    ${ControllerType},

    [Parameter(ParameterSetName='VMObject', Position=2)]
    [Parameter(ParameterSetName='VMName', Position=2)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(Position=3)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [Parameter(Position=4)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [Alias('Number')]
    [uint32]
    ${DiskNumber},

    [ValidateNotNull()]
    [string]
    ${ResourcePoolName},

    [Alias('ShareVirtualDisk')]
    [switch]
    ${SupportPersistentReservations},

    [switch]
    ${AllowUnverifiedPaths},

    [System.Nullable[uint64]]
    ${MaximumIOPS},

    [System.Nullable[uint64]]
    ${MinimumIOPS},

    [string]
    ${QoSPolicyID},

    [ciminstance]
    ${QoSPolicy},

    [switch]
    ${Passthru},

    [System.Nullable[Microsoft.HyperV.PowerShell.CacheAttributes]]
    ${OverrideCacheAttributes})

process {throw "Should not be called."}}


function Add-VMHostAssignableDevice {
[CmdletBinding(DefaultParameterSetName='Path')]
param(
    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [switch]
    ${Force},

    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${InstancePath},

    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${LocationPath},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMHostAssignableDevice[]]
    ${VMHostAssignableDevice},

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ResourcePoolName})

process {throw "Should not be called."}}


function Add-VMKeyStorageDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Alias('PSComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMObject', Position=2)]
    [Parameter(ParameterSetName='VMName', Position=2)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(Position=3)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [ValidateNotNull()]
    [string]
    ${ResourcePoolName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMMigrationNetwork {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Subnet},

    [Parameter(Position=1)]
    [ValidateNotNullOrEmpty()]
    [uint32]
    ${Priority},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Add-VMNetworkAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ManagementOS')]
    [switch]
    ${ManagementOS},

    [ValidateNotNullOrEmpty()]
    [string]
    ${SwitchName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [bool]
    ${IsLegacy},

    [Alias('VMNetworkAdapterName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [switch]
    ${DynamicMacAddress},

    [ValidateNotNull()]
    [bool]
    ${NumaAwarePlacement},

    [ValidateNotNullOrEmpty()]
    [string]
    ${StaticMacAddress},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNull()]
    [string]
    ${ResourcePoolName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Microsoft.HyperV.PowerShell.OnOffState]
    ${DeviceNaming})

process {throw "Should not be called."}}


function Add-VMNetworkAdapterAcl {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclAction]
    ${Action},

    [Parameter(Mandatory=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclDirection]
    ${Direction},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${LocalIPAddress},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${LocalMacAddress},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${RemoteIPAddress},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${RemoteMacAddress},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Add-VMNetworkAdapterExtendedAcl {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=1)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclAction]
    ${Action},

    [Parameter(Mandatory=$true, Position=2)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclDirection]
    ${Direction},

    [Parameter(Position=3)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${LocalIPAddress},

    [Parameter(Position=4)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${RemoteIPAddress},

    [Parameter(Position=5)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${LocalPort},

    [Parameter(Position=6)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${RemotePort},

    [Parameter(Position=7)]
    [ValidateNotNull()]
    [string]
    ${Protocol},

    [Parameter(Mandatory=$true, Position=8)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${Weight},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${Stateful},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${IdleSessionTimeout},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${IsolationID},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Add-VMNetworkAdapterRoutingDomainMapping {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [guid]
    ${RoutingDomainID},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${RoutingDomainName},

    [Parameter(Mandatory=$true, Position=3)]
    [ValidateNotNullOrEmpty()]
    [int[]]
    ${IsolationID},

    [Parameter(Position=4)]
    [string[]]
    ${IsolationName},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Add-VMPmemController {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMRemoteFx3dVideoAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMScsiController {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMStoragePath {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ResourcePoolName},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateSet('VHD','ISO','VFD')]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType]
    ${ResourcePoolType},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Add-VMSwitch {
[CmdletBinding(DefaultParameterSetName='NetworkByName')]
param(
    [Parameter(ParameterSetName='NetworkByName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='NetworkByName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='NetworkByName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='NetworkByName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='NetworkByObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ResourcePoolName})

process {throw "Should not be called."}}


function Add-VMSwitchExtensionPortFeature {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='ExternalPort', Mandatory=$true)]
    [switch]
    ${ExternalPort},

    [Parameter(ParameterSetName='ExternalPort')]
    [string]
    ${SwitchName},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='ExternalPort')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='ExternalPort')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ExternalPort')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature[]]
    ${VMSwitchExtensionFeature},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMSwitchExtensionSwitchFeature {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature[]]
    ${VMSwitchExtensionFeature},

    [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${SwitchName},

    [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Add-VMSwitchTeamMember {
[CmdletBinding(DefaultParameterSetName='SwitchName_NetAdapterName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Alias('PSComputerName')]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=0)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMSwitchName},

    [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
    [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
    [Alias('InterfaceAlias')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${NetAdapterName},

    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${NetAdapterInterfaceDescription},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Checkpoint-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(Position=1)]
    [Alias('CheckpointName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SnapshotName},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Compare-VM {
[CmdletBinding(DefaultParameterSetName='NameSingleDestination', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='Register')]
    [Parameter(ParameterSetName='Copy')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='Register')]
    [Parameter(ParameterSetName='Copy')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='Register')]
    [Parameter(ParameterSetName='Copy')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true)]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true)]
    [Parameter(ParameterSetName='Copy')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VirtualMachinePath},

    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='Copy')]
    [Alias('CheckpointFileLocation','SnapshotFileLocation')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SnapshotFilePath},

    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='Copy')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SmartPagingFilePath},

    [Parameter(ParameterSetName='CompatibilityReport', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMCompatibilityReport]
    ${CompatibilityReport},

    [switch]
    ${AsJob},

    [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [CimSession]
    ${DestinationCimSession},

    [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationHost},

    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [ValidateNotNullOrEmpty()]
    [pscredential]
    [System.Management.Automation.CredentialAttribute()]
    ${DestinationCredential},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
    [switch]
    ${IncludeStorage},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationStoragePath},

    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [ValidateNotNullOrEmpty()]
    [hashtable[]]
    ${Vhds},

    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [switch]
    ${RetainVhdCopiesOnSource},

    [Parameter(ParameterSetName='Register', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='Copy', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [Parameter(ParameterSetName='Copy', Position=1)]
    [string]
    ${VhdDestinationPath},

    [Parameter(ParameterSetName='Register')]
    [switch]
    ${Register},

    [Parameter(ParameterSetName='Copy', Mandatory=$true)]
    [switch]
    ${Copy},

    [Parameter(ParameterSetName='Copy')]
    [string]
    ${VhdSourcePath},

    [Parameter(ParameterSetName='Copy')]
    [switch]
    ${GenerateNewId})

process {throw "Should not be called."}}


function Complete-VMFailover {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Connect-VMNetworkAdapter {
[CmdletBinding(DefaultParameterSetName='Name_SwitchName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Object_SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='Object_SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='Object_UseAutomaticConnection', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapter[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='Name_SwitchName', Position=1)]
    [Parameter(ParameterSetName='Name_SwitchObject', Position=1)]
    [Parameter(ParameterSetName='Name_UseAutomaticConnection', Position=1)]
    [Alias('VMNetworkAdapterName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='Object_SwitchName', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='Name_SwitchName', Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SwitchName},

    [Parameter(ParameterSetName='Name_SwitchObject', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='Object_SwitchObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMSwitch]
    ${VMSwitch},

    [Parameter(ParameterSetName='Object_UseAutomaticConnection', Mandatory=$true)]
    [Parameter(ParameterSetName='Name_UseAutomaticConnection', Mandatory=$true)]
    [switch]
    ${UseAutomaticConnection},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='Name_SwitchName')]
    [Parameter(ParameterSetName='Name_UseAutomaticConnection')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name_SwitchName')]
    [Parameter(ParameterSetName='Name_UseAutomaticConnection')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name_SwitchName')]
    [Parameter(ParameterSetName='Name_UseAutomaticConnection')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Name_SwitchObject', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='Name_SwitchName', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='Name_UseAutomaticConnection', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName})

process {throw "Should not be called."}}


function Connect-VMSan {
[CmdletBinding(DefaultParameterSetName='StringWwn', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('SanName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='HbaObject', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ciminstance[]]
    ${HostBusAdapter},

    [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
    [Alias('Wwnn','NodeName','Wwnns','NodeNames','WorldWideNodeNames','NodeAddress')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${WorldWideNodeName},

    [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
    [Alias('Wwpn','PortName','Wwpns','PortNames','WorldWidePortNames','PortAddress')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${WorldWidePortName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Convert-VHD {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationPath},

    [ValidateNotNullOrEmpty()]
    [Microsoft.Vhd.PowerShell.VhdType]
    ${VHDType},

    [ValidateNotNullOrEmpty()]
    [string]
    ${ParentPath},

    [ValidateNotNullOrEmpty()]
    [uint32]
    ${BlockSizeBytes},

    [switch]
    ${DeleteSource},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [object]
    ${AddressAbstractionType},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Copy-VMFile {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(Mandatory=$true, Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SourcePath},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationPath},

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.CopyFileSourceType]
    ${FileSource},

    [switch]
    ${CreateFullPath},

    [switch]
    ${Force},

    [switch]
    ${AsJob})

process {throw "Should not be called."}}


function Debug-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${Force},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [switch]
    ${InjectNonMaskableInterrupt})

process {throw "Should not be called."}}


function Disable-VMConsoleSupport {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Disable-VMEventing {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [switch]
    ${Force},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Disable-VMIntegrationService {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMIntegrationService', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMIntegrationComponent[]]
    ${VMIntegrationService},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Disable-VMMigration {
[CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Disable-VMRemoteFXPhysicalVideoAdapter {
[CmdletBinding(DefaultParameterSetName='GPUByName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='GPUByName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='GPUByName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='GPUByName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='GPUByObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMRemoteFXPhysicalVideoAdapter[]]
    ${GPU},

    [Parameter(ParameterSetName='GPUByName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Disable-VMResourceMetering {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ResourcePool', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourcePool')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourcePool')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourcePool', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Name')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [Parameter(ParameterSetName='ResourcePool', Position=1, ValueFromPipelineByPropertyName=$true)]
    [ValidateSet('Ethernet','Memory','Processor','VHD')]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType]
    ${ResourcePoolType})

process {throw "Should not be called."}}


function Disable-VMSwitchExtension {
[CmdletBinding(DefaultParameterSetName='ExtensionName')]
param(
    [Parameter(ParameterSetName='ExtensionName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ExtensionNameSwitchName', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ExtensionName')]
    [Parameter(ParameterSetName='ExtensionNameSwitchName')]
    [Alias('PSComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ExtensionName')]
    [Parameter(ParameterSetName='ExtensionNameSwitchName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='ExtensionNameSwitchObject', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='ExtensionName', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='ExtensionNameSwitchName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='ExtensionObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
    ${VMSwitchExtension},

    [Parameter(ParameterSetName='ExtensionNameSwitchName', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMSwitchName},

    [Parameter(ParameterSetName='ExtensionNameSwitchObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch})

process {throw "Should not be called."}}


function Disable-VMTPM {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Disconnect-VMNetworkAdapter {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Obj', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapter[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='Name', Position=1)]
    [Alias('VMNetworkAdapterName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Disconnect-VMSan {
[CmdletBinding(DefaultParameterSetName='StringWwn', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='StringWwn')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='StringWwn')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('SanName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='HbaObject', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ciminstance[]]
    ${HostBusAdapter},

    [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
    [Alias('Wwnn','NodeName','Wwnns','NodeNames','WorldWideNodeNames','NodeAddress')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${WorldWideNodeName},

    [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
    [Alias('Wwpn','PortName','Wwpns','PortNames','WorldWidePortNames','PortAddress')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${WorldWidePortName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Dismount-VHD {
[CmdletBinding(DefaultParameterSetName='Path', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Disk', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('Number')]
    [ValidateNotNullOrEmpty()]
    [uint32]
    ${DiskNumber},

    [Parameter(ParameterSetName='Path', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='Path', ValueFromPipelineByPropertyName=$true)]
    [System.Nullable[guid]]
    ${SnapshotId},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Dismount-VMHostAssignableDevice {
[CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Position=2)]
    [string]
    ${InstancePath},

    [Parameter(Position=3)]
    [string]
    ${LocationPath},

    [Parameter(Position=4)]
    [switch]
    ${Force},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Enable-VMConsoleSupport {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Enable-VMEventing {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [switch]
    ${Force},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Enable-VMIntegrationService {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMIntegrationService', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMIntegrationComponent[]]
    ${VMIntegrationService},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Enable-VMMigration {
[CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Enable-VMRemoteFXPhysicalVideoAdapter {
[CmdletBinding(DefaultParameterSetName='GPUByName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='GPUByName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='GPUByName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='GPUByName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='GPUByObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMRemoteFXPhysicalVideoAdapter[]]
    ${GPU},

    [Parameter(ParameterSetName='GPUByName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Enable-VMReplication {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMName_AsReplica')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMName_AsReplica')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName_AsReplica')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMName_AsReplica', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMObject_AsReplica', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=1)]
    [Alias('ReplicaServer')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ReplicaServerName},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=2)]
    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=2)]
    [Alias('ReplicaPort')]
    [ValidateRange(1, 65535)]
    [int]
    ${ReplicaServerPort},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=3)]
    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=3)]
    [Alias('AuthType')]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.ReplicationAuthenticationType]
    ${AuthenticationType},

    [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='VMObject', ValueFromPipelineByPropertyName=$true)]
    [Alias('Thumbprint','Cert')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${CertificateThumbprint},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${CompressionEnabled},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${ReplicateHostKvpItems},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${BypassProxyServer},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${EnableWriteOrderPreservationAcrossDisks},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('VSSFreq')]
    [ValidateRange(1, 12)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${VSSSnapshotFrequencyHour},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('RecHist')]
    [ValidateRange(0, 24)]
    [System.Nullable[int]]
    ${RecoveryHistory},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Alias('RepFreq')]
    [ValidateRange(30, 900)]
    [System.Nullable[int]]
    ${ReplicationFrequencySec},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.HardDiskDrive[]]
    ${ExcludedVhd},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ExcludedVhdPath},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('AutoResync')]
    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${AutoResynchronizeEnabled},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('AutoResyncStart')]
    [ValidateNotNull()]
    [System.Nullable[timespan]]
    ${AutoResynchronizeIntervalStart},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('AutoResyncEnd')]
    [ValidateNotNull()]
    [System.Nullable[timespan]]
    ${AutoResynchronizeIntervalEnd},

    [Parameter(ParameterSetName='VMObject_AsReplica')]
    [Parameter(ParameterSetName='VMName_AsReplica')]
    [switch]
    ${AsReplica},

    [Parameter(ParameterSetName='VMName_AsReplica', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='VMObject_AsReplica', ValueFromPipelineByPropertyName=$true)]
    [Alias('AllowedPS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${AllowedPrimaryServer},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Enable-VMResourceMetering {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ResourcePool', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourcePool')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourcePool')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourcePool', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Name')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [Parameter(ParameterSetName='ResourcePool', Position=1, ValueFromPipelineByPropertyName=$true)]
    [ValidateSet('Ethernet','Memory','Processor','VHD')]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType]
    ${ResourcePoolType})

process {throw "Should not be called."}}


function Enable-VMSwitchExtension {
[CmdletBinding(DefaultParameterSetName='ExtensionName')]
param(
    [Parameter(ParameterSetName='ExtensionNameSwitchName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ExtensionName', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ExtensionName')]
    [Parameter(ParameterSetName='ExtensionNameSwitchName')]
    [Alias('PSComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ExtensionName')]
    [Parameter(ParameterSetName='ExtensionNameSwitchName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='ExtensionNameSwitchObject', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='ExtensionName', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='ExtensionNameSwitchName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='ExtensionObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
    ${VMSwitchExtension},

    [Parameter(ParameterSetName='ExtensionNameSwitchName', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMSwitchName},

    [Parameter(ParameterSetName='ExtensionNameSwitchObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch})

process {throw "Should not be called."}}


function Enable-VMTPM {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Export-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(Mandatory=$true, Position=1)]
    [string]
    ${Path},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.CaptureLiveState]]
    ${CaptureLiveState})

process {throw "Should not be called."}}


function Export-VMSnapshot {
[CmdletBinding(DefaultParameterSetName='SnapshotName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='SnapshotObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot[]]
    ${VMSnapshot},

    [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [Parameter(ParameterSetName='SnapshotName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Get-VHD {
[CmdletBinding(DefaultParameterSetName='Path')]
param(
    [Parameter(ParameterSetName='Disk', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('Number')]
    [ValidateNotNullOrEmpty()]
    [uint32]
    ${DiskNumber},

    [Parameter(ParameterSetName='Path', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='VMId', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNullOrEmpty()]
    [guid[]]
    ${VMId},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VHDSet {
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [switch]
    ${GetAllPaths},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VHDSnapshot {
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [switch]
    ${GetParentPaths},

    [guid[]]
    ${SnapshotId},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VM {
[CmdletBinding(DefaultParameterSetName='Name')]
param(
    [Parameter(ParameterSetName='Name', Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Id', Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [System.Nullable[guid]]
    ${Id},

    [Parameter(ParameterSetName='ClusterObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.FailoverClusters.PowerShell.ClusterObject')]
    [psobject]
    ${ClusterObject})

process {throw "Should not be called."}}


function Get-VMAssignableDevice {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMBios {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName})

process {throw "Should not be called."}}


function Get-VMComPort {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(Position=1)]
    [ValidateRange(1, 2)]
    [int]
    ${Number},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMConnectAccess {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMId', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [guid[]]
    ${VMId},

    [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [Alias('UserId','Sid')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${UserName},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMDvdDrive {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [Parameter(ParameterSetName='VMSnapshot')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMDriveController[]]
    ${VMDriveController},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot})

process {throw "Should not be called."}}


function Get-VMFibreChannelHba {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName})

process {throw "Should not be called."}}


function Get-VMFirmware {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName})

process {throw "Should not be called."}}


function Get-VMFloppyDiskDrive {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName})

process {throw "Should not be called."}}


function Get-VMGpuPartitionAdapter {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${AdapterId})

process {throw "Should not be called."}}


function Get-VMGroup {
[CmdletBinding(DefaultParameterSetName='Name')]
param(
    [Parameter(ParameterSetName='Id')]
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Name', Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='Id', Position=0)]
    [ValidateNotNullOrEmpty()]
    [guid]
    ${Id})

process {throw "Should not be called."}}


function Get-VMHardDiskDrive {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMDriveController[]]
    ${VMDriveController},

    [Parameter(ParameterSetName='VMSnapshot')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMSnapshot')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [System.Nullable[Microsoft.HyperV.PowerShell.ControllerType]]
    ${ControllerType})

process {throw "Should not be called."}}


function Get-VMHost {
[CmdletBinding(DefaultParameterSetName='ComputerName')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMHostAssignableDevice {
[CmdletBinding()]
param(
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMHostCluster {
[CmdletBinding(DefaultParameterSetName='ClusterName')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ClusterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ClusterName},

    [Parameter(ParameterSetName='ClusterName', Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMHostNumaNode {
[CmdletBinding(DefaultParameterSetName='ComputerName')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${Id})

process {throw "Should not be called."}}


function Get-VMHostNumaNodeStatus {
[CmdletBinding(DefaultParameterSetName='ComputerName')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${Id})

process {throw "Should not be called."}}


function Get-VMHostSupportedVersion {
[CmdletBinding(DefaultParameterSetName='ComputerName')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [switch]
    ${Default})

process {throw "Should not be called."}}


function Get-VMIdeController {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(Position=1)]
    [ValidateRange(0, 1)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber})

process {throw "Should not be called."}}


function Get-VMIntegrationService {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name})

process {throw "Should not be called."}}


function Get-VMKeyProtector {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName})

process {throw "Should not be called."}}


function Get-VMKeyStorageDrive {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMDriveController[]]
    ${VMDriveController})

process {throw "Should not be called."}}


function Get-VMMemory {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName})

process {throw "Should not be called."}}


function Get-VMMigrationNetwork {
[CmdletBinding()]
param(
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Subnet},

    [ValidateNotNullOrEmpty()]
    [uint32[]]
    ${Priority})

process {throw "Should not be called."}}


function Get-VMNetworkAdapter {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [bool]
    ${IsLegacy},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='All')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='All')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='All')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(Position=1)]
    [Alias('VMNetworkAdapterName')]
    [string]
    ${Name},

    [Parameter(ParameterSetName='All', Mandatory=$true)]
    [switch]
    ${All},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SwitchName})

process {throw "Should not be called."}}


function Get-VMNetworkAdapterAcl {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMNetworkAdapterExtendedAcl {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMNetworkAdapterFailoverConfiguration {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapter[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [string]
    ${VMNetworkAdapterName})

process {throw "Should not be called."}}


function Get-VMNetworkAdapterIsolation {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMNetworkAdapterRdma {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Alias('VMNetworkAdapterName')]
    [string]
    ${Name},

    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SwitchName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Get-VMNetworkAdapterRoutingDomainMapping {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [guid]
    ${RoutingDomainID},

    [string]
    ${RoutingDomainName},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMNetworkAdapterTeamMapping {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Alias('VMNetworkAdapterName')]
    [string]
    ${Name},

    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SwitchName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Get-VMNetworkAdapterVlan {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMPartitionableGpu {
[CmdletBinding(DefaultParameterSetName='ComputerName')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [ValidateNotNullOrEmpty()]
    [string]
    ${Name})

process {throw "Should not be called."}}


function Get-VMPmemController {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(Position=1)]
    [ValidateNotNull()]
    [ValidateRange(0, 0)]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMProcessor {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMRemoteFx3dVideoAdapter {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot})

process {throw "Should not be called."}}


function Get-VMRemoteFXPhysicalVideoAdapter {
[CmdletBinding(DefaultParameterSetName='ComputerName')]
param(
    [Parameter(ParameterSetName='CimSession', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name})

process {throw "Should not be called."}}


function Get-VMReplication {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
    [Alias('Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [Alias('ReplicaServer')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ReplicaServerName},

    [Parameter(ParameterSetName='VMName')]
    [Alias('PrimaryServer')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${PrimaryServerName},

    [Parameter(ParameterSetName='VMName')]
    [Alias('State')]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationState]]
    ${ReplicationState},

    [Parameter(ParameterSetName='VMName')]
    [Alias('Health')]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationHealthState]]
    ${ReplicationHealth},

    [Parameter(ParameterSetName='VMName')]
    [Alias('Mode')]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationMode]]
    ${ReplicationMode},

    [Alias('Relationship')]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
    ${ReplicationRelationshipType},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${TrustGroup})

process {throw "Should not be called."}}


function Get-VMReplicationAuthorizationEntry {
[CmdletBinding()]
param(
    [Parameter(Position=0, ValueFromPipeline=$true)]
    [Alias('AllowedPS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${AllowedPrimaryServer},

    [Alias('StorageLoc')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ReplicaStorageLocation},

    [ValidateNotNullOrEmpty()]
    [string]
    ${TrustGroup},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMReplicationServer {
[CmdletBinding(DefaultParameterSetName='ComputerName')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMResourcePool {
[CmdletBinding()]
param(
    [Parameter(Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(Position=1)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType[]]
    ${ResourcePoolType},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMSan {
[CmdletBinding()]
param(
    [Parameter(Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('SanName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMScsiController {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(Position=1)]
    [ValidateNotNull()]
    [ValidateRange(0, 63)]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMSecurity {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMSnapshot {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Id')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Id', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [System.Nullable[guid]]
    ${Id},

    [Parameter(ParameterSetName='Parent', Position=0)]
    [Parameter(ParameterSetName='VMName', Position=1)]
    [Parameter(ParameterSetName='VMObject', Position=1)]
    [Parameter(ParameterSetName='Child', Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='Child', Mandatory=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${ChildOf},

    [Parameter(ParameterSetName='Parent', Mandatory=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VirtualMachineBase]
    ${ParentOf},

    [Parameter(ParameterSetName='Parent')]
    [Parameter(ParameterSetName='Child')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('VMRecoveryCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.SnapshotType]
    ${SnapshotType})

process {throw "Should not be called."}}


function Get-VMStoragePath {
[CmdletBinding()]
param(
    [Parameter(Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ResourcePoolName},

    [Parameter(Mandatory=$true, Position=2)]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType]
    ${ResourcePoolType},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMStorageSettings {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Get-VMSwitch {
[CmdletBinding(DefaultParameterSetName='Name')]
param(
    [Parameter(ParameterSetName='Id', Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('SwitchId')]
    [ValidateNotNull()]
    [guid[]]
    ${Id},

    [Parameter(ParameterSetName='Name', Position=0)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ResourcePoolName},

    [Microsoft.HyperV.PowerShell.VMSwitchType[]]
    ${SwitchType},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMSwitchExtension {
[CmdletBinding(DefaultParameterSetName='SwitchName')]
param(
    [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMSwitchName},

    [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [Parameter(Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='SwitchName', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SwitchName')]
    [Alias('PSComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMSwitchExtensionPortData {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='ExternalPort', Mandatory=$true)]
    [switch]
    ${ExternalPort},

    [Parameter(ParameterSetName='ExternalPort')]
    [string]
    ${SwitchName},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='ExternalPort')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='ExternalPort')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='ExternalPort')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${FeatureName},

    [ValidateNotNullOrEmpty()]
    [guid[]]
    ${FeatureId},

    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
    ${Extension},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ExtensionName})

process {throw "Should not be called."}}


function Get-VMSwitchExtensionPortFeature {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='ExternalPort', Mandatory=$true)]
    [switch]
    ${ExternalPort},

    [Parameter(ParameterSetName='ExternalPort')]
    [string]
    ${SwitchName},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='ExternalPort')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='ExternalPort')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='ExternalPort')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${FeatureName},

    [ValidateNotNullOrEmpty()]
    [guid[]]
    ${FeatureId},

    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
    ${Extension},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ExtensionName})

process {throw "Should not be called."}}


function Get-VMSwitchExtensionSwitchData {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${SwitchName},

    [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${FeatureName},

    [ValidateNotNullOrEmpty()]
    [guid[]]
    ${FeatureId},

    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
    ${Extension},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ExtensionName})

process {throw "Should not be called."}}


function Get-VMSwitchExtensionSwitchFeature {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${SwitchName},

    [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${FeatureName},

    [ValidateNotNullOrEmpty()]
    [guid[]]
    ${FeatureId},

    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
    ${Extension},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ExtensionName})

process {throw "Should not be called."}}


function Get-VMSwitchTeam {
[CmdletBinding(DefaultParameterSetName='Name')]
param(
    [Parameter(ParameterSetName='Name', Position=0)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='SwitchObject', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMSystemSwitchExtension {
[CmdletBinding()]
param(
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMSystemSwitchExtensionPortFeature {
[CmdletBinding()]
param(
    [string[]]
    ${FeatureName},

    [guid[]]
    ${FeatureId},

    [string[]]
    ${ExtensionName},

    [Microsoft.HyperV.PowerShell.VMSystemSwitchExtension[]]
    ${SystemSwitchExtension},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMSystemSwitchExtensionSwitchFeature {
[CmdletBinding()]
param(
    [string[]]
    ${FeatureName},

    [guid[]]
    ${FeatureId},

    [string[]]
    ${ExtensionName},

    [Microsoft.HyperV.PowerShell.VMSystemSwitchExtension[]]
    ${SystemSwitchExtension},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Get-VMVideo {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Grant-VMConnectAccess {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMId', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [guid[]]
    ${VMId},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [Alias('UserId','Sid')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${UserName},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Import-VM {
[CmdletBinding(DefaultParameterSetName='Register', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Register')]
    [Parameter(ParameterSetName='Copy')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Register')]
    [Parameter(ParameterSetName='Copy')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Copy')]
    [Parameter(ParameterSetName='Register')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='CompatibilityReport', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMCompatibilityReport]
    ${CompatibilityReport},

    [Parameter(ParameterSetName='Register', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='Copy', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [Parameter(ParameterSetName='Copy', Position=1)]
    [string]
    ${VhdDestinationPath},

    [Parameter(ParameterSetName='Register')]
    [switch]
    ${Register},

    [Parameter(ParameterSetName='Copy', Mandatory=$true)]
    [switch]
    ${Copy},

    [Parameter(ParameterSetName='Copy')]
    [string]
    ${VirtualMachinePath},

    [Parameter(ParameterSetName='Copy')]
    [Alias('CheckpointFileLocation','SnapshotFileLocation')]
    [string]
    ${SnapshotFilePath},

    [Parameter(ParameterSetName='Copy')]
    [string]
    ${SmartPagingFilePath},

    [Parameter(ParameterSetName='Copy')]
    [string]
    ${VhdSourcePath},

    [Parameter(ParameterSetName='Copy')]
    [switch]
    ${GenerateNewId},

    [switch]
    ${AsJob})

process {throw "Should not be called."}}


function Import-VMInitialReplication {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplication[]]
    ${VMReplication},

    [Parameter(Mandatory=$true, Position=1)]
    [Alias('IRLoc')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Measure-VM {
[CmdletBinding(DefaultParameterSetName='Name')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM})

process {throw "Should not be called."}}


function Measure-VMReplication {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
    [Alias('Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [Alias('ReplicaServer')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ReplicaServerName},

    [Parameter(ParameterSetName='VMName')]
    [Alias('PrimaryServer')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${PrimaryServerName},

    [Parameter(ParameterSetName='VMName')]
    [Alias('State')]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationState]]
    ${ReplicationState},

    [Parameter(ParameterSetName='VMName')]
    [Alias('Health')]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationHealthState]]
    ${ReplicationHealth},

    [Parameter(ParameterSetName='VMName')]
    [Alias('Mode')]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationMode]]
    ${ReplicationMode},

    [Alias('Relationship')]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
    ${ReplicationRelationshipType},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${TrustGroup})

process {throw "Should not be called."}}


function Measure-VMResourcePool {
[CmdletBinding()]
param(
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(Position=1, ValueFromPipelineByPropertyName=$true)]
    [ValidateSet('Ethernet','Memory','Processor','VHD')]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType[]]
    ${ResourcePoolType})

process {throw "Should not be called."}}


function Merge-VHD {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [Parameter(Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationPath},

    [switch]
    ${Force},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Mount-VHD {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [switch]
    ${NoDriveLetter},

    [switch]
    ${ReadOnly},

    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [System.Nullable[guid]]
    ${SnapshotId},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Mount-VMHostAssignableDevice {
[CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMHostAssignableDevice[]]
    ${HostAssignableDevice},

    [Parameter(Position=2)]
    [string]
    ${InstancePath},

    [Parameter(Position=3)]
    [string]
    ${LocationPath},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Move-VM {
[CmdletBinding(DefaultParameterSetName='NameSingleDestination', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='CompatibilityReport', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMCompatibilityReport]
    ${CompatibilityReport},

    [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [CimSession]
    ${DestinationCimSession},

    [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationHost},

    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [ValidateNotNullOrEmpty()]
    [pscredential]
    [System.Management.Automation.CredentialAttribute()]
    ${DestinationCredential},

    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
    [switch]
    ${IncludeStorage},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationStoragePath},

    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true)]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VirtualMachinePath},

    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [Alias('CheckpointFileLocation','SnapshotFileLocation')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SnapshotFilePath},

    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SmartPagingFilePath},

    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [ValidateNotNullOrEmpty()]
    [hashtable[]]
    ${Vhds},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [switch]
    ${RetainVhdCopiesOnSource},

    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
    [Parameter(ParameterSetName='VMSingleDestination')]
    [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
    [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
    [switch]
    ${RemoveSourceUnmanagedVhds},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Move-VMStorage {
[CmdletBinding(DefaultParameterSetName='NameSingleDestination', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='NameSingleDestination')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationStoragePath},

    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VirtualMachinePath},

    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Alias('CheckpointFileLocation','SnapshotFileLocation')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SnapshotFilePath},

    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SmartPagingFilePath},

    [Parameter(ParameterSetName='NameMultipleDestinations')]
    [Parameter(ParameterSetName='VMMultipleDestinations')]
    [ValidateNotNullOrEmpty()]
    [hashtable[]]
    ${Vhds},

    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [switch]
    ${RetainVhdCopiesOnSource},

    [switch]
    ${RemoveSourceUnmanagedVhds},

    [switch]
    ${AllowUnverifiedPaths},

    [switch]
    ${AsJob})

process {throw "Should not be called."}}


function New-VFD {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function New-VHD {
[CmdletBinding(DefaultParameterSetName='DynamicWithoutSource', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='Differencing', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ParentPath},

    [Parameter(ParameterSetName='FixedWithoutSource', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='DynamicWithoutSource', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='Differencing', Position=2)]
    [ValidateNotNullOrEmpty()]
    [uint64]
    ${SizeBytes},

    [Parameter(ParameterSetName='FixedWithSource', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='DynamicWithSource', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Number')]
    [ValidateNotNullOrEmpty()]
    [uint32]
    ${SourceDisk},

    [Parameter(ParameterSetName='DynamicWithSource', Mandatory=$true)]
    [Parameter(ParameterSetName='DynamicWithoutSource')]
    [switch]
    ${Dynamic},

    [Parameter(ParameterSetName='FixedWithSource', Mandatory=$true)]
    [Parameter(ParameterSetName='FixedWithoutSource', Mandatory=$true)]
    [switch]
    ${Fixed},

    [Parameter(ParameterSetName='Differencing')]
    [switch]
    ${Differencing},

    [ValidateNotNullOrEmpty()]
    [uint32]
    ${BlockSizeBytes},

    [Parameter(ParameterSetName='FixedWithoutSource')]
    [Parameter(ParameterSetName='DynamicWithoutSource')]
    [ValidateSet('512','4096')]
    [ValidateNotNullOrEmpty()]
    [uint32]
    ${LogicalSectorSizeBytes},

    [Parameter(ParameterSetName='Differencing')]
    [Parameter(ParameterSetName='FixedWithoutSource')]
    [Parameter(ParameterSetName='DynamicWithoutSource')]
    [ValidateSet('512','4096')]
    [ValidateNotNullOrEmpty()]
    [uint32]
    ${PhysicalSectorSizeBytes},

    [Parameter(ParameterSetName='FixedWithoutSource')]
    [ValidateSet('None','BTT')]
    [object]
    ${AddressAbstractionType},

    [Parameter(ParameterSetName='FixedWithoutSource')]
    [ValidateSet('0','1GB','1073741824')]
    [uint64]
    ${DataAlignmentBytes},

    [switch]
    ${AsJob},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function New-VM {
[CmdletBinding(DefaultParameterSetName='No VHD', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(Position=1)]
    [ValidateNotNull()]
    [System.Nullable[long]]
    ${MemoryStartupBytes},

    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.BootDevice]]
    ${BootDevice},

    [Parameter(ParameterSetName='No VHD')]
    [switch]
    ${NoVHD},

    [ValidateNotNullOrEmpty()]
    [string]
    ${SwitchName},

    [Parameter(ParameterSetName='New VHD', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewVHDPath},

    [Parameter(ParameterSetName='New VHD', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [uint64]
    ${NewVHDSizeBytes},

    [Parameter(ParameterSetName='Existing VHD', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VHDPath},

    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [ValidateNotNull()]
    [version]
    ${Version},

    [switch]
    ${Prerelease},

    [switch]
    ${Experimental},

    [Parameter(Position=2)]
    [ValidateSet('1','2')]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[int16]]
    ${Generation},

    [switch]
    ${Force},

    [switch]
    ${AsJob},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function New-VMGroup {
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.GroupType]
    ${GroupType},

    [Parameter(Position=2)]
    [ValidateNotNullOrEmpty()]
    [guid]
    ${Id},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function New-VMReplicationAuthorizationEntry {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('AllowedPS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${AllowedPrimaryServer},

    [Parameter(Mandatory=$true, Position=1)]
    [Alias('StorageLoc')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ReplicaStorageLocation},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${TrustGroup},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function New-VMResourcePool {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType[]]
    ${ResourcePoolType},

    [Parameter(Position=2)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ParentName},

    [Parameter(Position=3)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Paths},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function New-VMSan {
[CmdletBinding(DefaultParameterSetName='HbaObject', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [ValidateNotNullOrEmpty()]
    [CimSession]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential]
    [System.Management.Automation.CredentialAttribute()]
    ${Credential},

    [Parameter(Mandatory=$true, Position=0)]
    [Alias('SanName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [ValidateNotNull()]
    [string]
    ${Note},

    [Parameter(ParameterSetName='HbaObject')]
    [ValidateNotNullOrEmpty()]
    [ciminstance[]]
    ${HostBusAdapter},

    [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
    [Alias('Wwnn','NodeName','Wwnns','NodeNames','WorldWideNodeNames','NodeAddress')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${WorldWideNodeName},

    [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
    [Alias('Wwpn','PortName','Wwpns','PortNames','WorldWidePortNames','PortAddress')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${WorldWidePortName})

process {throw "Should not be called."}}


function New-VMSwitch {
[CmdletBinding(DefaultParameterSetName='NetAdapterName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchType', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchType', ValueFromPipelineByPropertyName=$true)]
    [Alias('PSComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchType', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Mandatory=$true, Position=0)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Alias('SwitchId')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Id},

    [Parameter(ParameterSetName='SwitchType', Mandatory=$true)]
    [ValidateSet('Internal','Private')]
    [Microsoft.HyperV.PowerShell.VMSwitchType]
    ${SwitchType},

    [Parameter(ParameterSetName='NetAdapterInterfaceDescription')]
    [Parameter(ParameterSetName='NetAdapterName')]
    [bool]
    ${AllowManagementOS},

    [Parameter(ParameterSetName='NetAdapterName', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('InterfaceAlias')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${NetAdapterName},

    [Parameter(ParameterSetName='NetAdapterInterfaceDescription', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('InterfaceDescription')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${NetAdapterInterfaceDescription},

    [ValidateNotNull()]
    [string]
    ${Notes},

    [Microsoft.HyperV.PowerShell.VMSwitchBandwidthMode]
    ${MinimumBandwidthMode},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${EnableIov},

    [System.Nullable[bool]]
    ${EnablePacketDirect},

    [System.Nullable[bool]]
    ${EnableEmbeddedTeaming})

process {throw "Should not be called."}}


function Optimize-VHD {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [ValidateNotNullOrEmpty()]
    [Microsoft.Vhd.PowerShell.VhdCompactMode]
    ${Mode},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Optimize-VHDSet {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Remove-VHDSnapshot {
[CmdletBinding(DefaultParameterSetName='Path', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Path', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [switch]
    ${PersistReferencePoint},

    [Parameter(ParameterSetName='Path', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [guid[]]
    ${SnapshotId},

    [Parameter(ParameterSetName='VHDSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.Vhd.PowerShell.VHDSnapshotInfo[]]
    ${VHDSnapshot},

    [switch]
    ${AsJob},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Remove-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [switch]
    ${Force},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMAssignableDevice {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMAssignedDevice[]]
    ${VMAssignableDevice},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${InstancePath},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${LocationPath},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMDvdDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='VMDvdDrive', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.DvdDrive[]]
    ${VMDvdDrive},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMFibreChannelHba {
[CmdletBinding(DefaultParameterSetName='VMFibreChannelHba', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='VMFibreChannelHba', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMFibreChannelHba[]]
    ${VMFibreChannelHba},

    [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=1)]
    [Alias('Wwnn1')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWideNodeNameSetA},

    [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=2)]
    [Alias('Wwpn1')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWidePortNameSetA},

    [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=3)]
    [Alias('Wwnn2')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWideNodeNameSetB},

    [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=4)]
    [Alias('Wwpn2')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWidePortNameSetB},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Remove-VMGpuPartitionAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMGpuPartitionAdapter[]]
    ${VMGpuPartitionAdapter},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${AdapterId})

process {throw "Should not be called."}}


function Remove-VMGroup {
[CmdletBinding(DefaultParameterSetName='Name')]
param(
    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Id')]
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='Id', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [guid]
    ${Id},

    [Parameter(ParameterSetName='InputObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMGroup]
    ${VMGroup},

    [switch]
    ${Force})

process {throw "Should not be called."}}


function Remove-VMGroupMember {
[CmdletBinding(DefaultParameterSetName='VM Using Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMGroup Using ID')]
    [Parameter(ParameterSetName='VM Using Name')]
    [Parameter(ParameterSetName='VMGroup Using Name')]
    [Parameter(ParameterSetName='VM Using ID')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VM Using Name')]
    [Parameter(ParameterSetName='VMGroup Using Name')]
    [Parameter(ParameterSetName='VM Using ID')]
    [Parameter(ParameterSetName='VMGroup Using ID')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMGroup Using Name')]
    [Parameter(ParameterSetName='VM Using Name')]
    [Parameter(ParameterSetName='VM Using ID')]
    [Parameter(ParameterSetName='VMGroup Using ID')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VM Using Name', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VMGroup Using Name', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='VMGroup Using ID', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VM Using ID', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [guid]
    ${Id},

    [Parameter(ParameterSetName='VM Using InputObject', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VMGroup Using InputObject', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMGroup]
    ${VMGroup},

    [Parameter(ParameterSetName='VM Using ID', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VM Using Name', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VM Using InputObject', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMGroup Using Name', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMGroup Using ID', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMGroup Using InputObject', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMGroup[]]
    ${VMGroupMember},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMHardDiskDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='VMHardDiskDrive', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.HardDiskDrive[]]
    ${VMHardDiskDrive},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.ControllerType]]
    ${ControllerType},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=3)]
    [System.Nullable[int]]
    ${ControllerLocation},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMHostAssignableDevice {
[CmdletBinding(DefaultParameterSetName='Path', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${InstancePath},

    [Parameter(ParameterSetName='Path')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${LocationPath},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMHostAssignableDevice[]]
    ${VMHostAssignableDevice},

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ResourcePoolName},

    [switch]
    ${Force})

process {throw "Should not be called."}}


function Remove-VMKeyStorageDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='VMKeyStorageDrive', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.KeyStorageDrive[]]
    ${VMKeyStorageDrive},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMMigrationNetwork {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Subnet},

    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMNetworkAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('VMNetworkAdapterName')]
    [string]
    ${Name},

    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SwitchName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMNetworkAdapterAcl {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='InputObjectParameter', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclSetting[]]
    ${InputObject},

    [Parameter(ParameterSetName='VMName', Mandatory=$true)]
    [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true)]
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclAction]
    ${Action},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true)]
    [Parameter(ParameterSetName='VMName', Mandatory=$true)]
    [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclDirection]
    ${Direction},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourceObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${LocalIPAddress},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourceObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${LocalMacAddress},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourceObject')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${RemoteIPAddress},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourceObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${RemoteMacAddress},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMNetworkAdapterExtendedAcl {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='InputObjectParameter', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclSetting[]]
    ${InputObject},

    [Parameter(ParameterSetName='VMName', Mandatory=$true)]
    [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true)]
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [int]
    ${Weight},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
    [Parameter(ParameterSetName='VMName', Mandatory=$true)]
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true)]
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclDirection]
    ${Direction},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMNetworkAdapterRoutingDomainMapping {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='InputObjectParameter', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting[]]
    ${InputObject},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourceObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [guid]
    ${RoutingDomainID},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ResourceObject')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${RoutingDomainName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMNetworkAdapterTeamMapping {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('VMNetworkAdapterName')]
    [string]
    ${Name},

    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SwitchName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMPmemController {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMPmemController[]]
    ${VMPmemController},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMRemoteFx3dVideoAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='RemoteFXAdapter', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter[]]
    ${VMRemoteFx3dVideoAdapter},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMReplication {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplication[]]
    ${VMReplication},

    [Parameter(ParameterSetName='VMName')]
    [Alias('Relationship')]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
    ${ReplicationRelationshipType},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMReplicationAuthorizationEntry {
[CmdletBinding(DefaultParameterSetName='PrimaryServerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='PrimaryServerName')]
    [Parameter(ParameterSetName='TrustGroup')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='TrustGroup')]
    [Parameter(ParameterSetName='PrimaryServerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='PrimaryServerName')]
    [Parameter(ParameterSetName='TrustGroup')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='PrimaryServerName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('AllowedPS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${AllowedPrimaryServer},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMRepAuthEntry')]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplicationAuthorizationEntry[]]
    ${VMReplicationAuthorizationEntry},

    [Parameter(ParameterSetName='TrustGroup', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${TrustGroup},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMResourcePool {
[CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='CimSession', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType[]]
    ${ResourcePoolType},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMSan {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('SanName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Remove-VMSavedState {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot})

process {throw "Should not be called."}}


function Remove-VMScsiController {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMScsiController[]]
    ${VMScsiController},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
    [int]
    ${ControllerNumber},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMSnapshot {
[CmdletBinding(DefaultParameterSetName='SnapshotName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='SnapshotObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSnapshot[]]
    ${VMSnapshot},

    [Parameter(ParameterSetName='SnapshotName', Position=1, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMObject', Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Alias('IncludeAllChildCheckpoints')]
    [switch]
    ${IncludeAllChildSnapshots},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Remove-VMStoragePath {
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ResourcePoolName},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateSet('VHD','ISO','VFD')]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType]
    ${ResourcePoolType},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Remove-VMSwitch {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [Parameter(Position=1)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ResourcePoolName},

    [switch]
    ${Force})

process {throw "Should not be called."}}


function Remove-VMSwitchExtensionPortFeature {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature[]]
    ${VMSwitchExtensionFeature},

    [switch]
    ${Passthru},

    [string[]]
    ${VMName},

    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [switch]
    ${ManagementOS},

    [switch]
    ${ExternalPort},

    [string]
    ${SwitchName},

    [string]
    ${VMNetworkAdapterName},

    [string[]]
    ${ComputerName},

    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Remove-VMSwitchExtensionSwitchFeature {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature[]]
    ${VMSwitchExtensionFeature},

    [switch]
    ${Passthru},

    [string[]]
    ${ComputerName},

    [string[]]
    ${SwitchName},

    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Remove-VMSwitchTeamMember {
[CmdletBinding(DefaultParameterSetName='SwitchName_NetAdapterName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SwitchName_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Alias('PSComputerName')]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=0)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMSwitchName},

    [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
    [Alias('InterfaceAlias')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${NetAdapterName},

    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${NetAdapterInterfaceDescription},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Rename-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Rename-VMGroup {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='Id')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='Id', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [guid]
    ${Id},

    [Parameter(ParameterSetName='InputObject', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMGroup[]]
    ${VMGroup},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='Id', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='InputObject', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Rename-VMNetworkAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ManagementOS', Position=1)]
    [Parameter(ParameterSetName='VMName', Position=1)]
    [Parameter(ParameterSetName='VMObject', Position=1)]
    [Alias('VMNetworkAdapterName')]
    [string]
    ${Name},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Rename-VMResourcePool {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType]
    ${ResourcePoolType},

    [Parameter(Mandatory=$true, Position=2)]
    [string]
    ${NewName},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Rename-VMSan {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('SanName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewName},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Rename-VMSnapshot {
[CmdletBinding(DefaultParameterSetName='SnapshotName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='SnapshotObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VM', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VM', Mandatory=$true)]
    [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Rename-VMSwitch {
[CmdletBinding(DefaultParameterSetName='SwitchName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SwitchName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitch]
    ${VMSwitch},

    [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Repair-VM {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMCompatibilityReport]
    ${CompatibilityReport},

    [Alias('CheckpointFileLocation','SnapshotFileLocation')]
    [string]
    ${SnapshotFilePath},

    [string]
    ${Path},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Reset-VMReplicationStatistics {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplication[]]
    ${VMReplication},

    [Parameter(ParameterSetName='VMName')]
    [Alias('Relationship')]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
    ${ReplicationRelationshipType},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Reset-VMResourceMetering {
[CmdletBinding(DefaultParameterSetName='VMName')]
param(
    [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ResourcePool', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourcePool')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourcePool')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='ResourcePool', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Name')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [Parameter(ParameterSetName='ResourcePool', Position=1, ValueFromPipelineByPropertyName=$true)]
    [ValidateSet('Ethernet','Memory','Processor','VHD')]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType]
    ${ResourcePoolType})

process {throw "Should not be called."}}


function Resize-VHD {
[CmdletBinding(DefaultParameterSetName='Size', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='Size', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [uint64]
    ${SizeBytes},

    [Parameter(ParameterSetName='MinimumSize', Mandatory=$true)]
    [switch]
    ${ToMinimumSize},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Restart-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='NameWait')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='NameWait')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='NameWait')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObjectWait', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='NameWait', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${Force},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='VMObjectWait', Mandatory=$true)]
    [Parameter(ParameterSetName='NameWait', Mandatory=$true)]
    [switch]
    ${Wait},

    [Parameter(ParameterSetName='NameWait')]
    [Parameter(ParameterSetName='VMObjectWait')]
    [Microsoft.HyperV.PowerShell.Commands.RestartVM+WaitVMTypes]
    ${For},

    [Parameter(ParameterSetName='NameWait')]
    [Parameter(ParameterSetName='VMObjectWait')]
    [ValidateRange(1, 65535)]
    [uint16]
    ${Delay},

    [Parameter(ParameterSetName='NameWait')]
    [Parameter(ParameterSetName='VMObjectWait')]
    [Alias('TimeoutSec')]
    [ValidateRange(-1, 2147483647)]
    [System.Nullable[int]]
    ${Timeout},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='Name')]
    [Parameter(ParameterSetName='NameWait')]
    [Parameter(ParameterSetName='VMObjectWait')]
    [Microsoft.HyperV.PowerShell.Commands.RestartVM+RestartType]
    ${Type})

process {throw "Should not be called."}}


function Restore-VMSnapshot {
[CmdletBinding(DefaultParameterSetName='SnapshotName', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SnapshotName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='SnapshotObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMCheckpoint')]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMSnapshot},

    [Parameter(ParameterSetName='VM', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VM', Mandatory=$true)]
    [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Resume-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Resume-VMReplication {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplication[]]
    ${VMReplication},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('Relationship')]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
    ${ReplicationRelationshipType},

    [Alias('ResyncStart')]
    [ValidateNotNull()]
    [System.Nullable[datetime]]
    ${ResynchronizeStartTime},

    [Alias('Resync')]
    [switch]
    ${Resynchronize},

    [switch]
    ${AsJob},

    [switch]
    ${Continue},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Revoke-VMConnectAccess {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [Alias('UserId','Sid')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${UserName},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='VMId', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [guid[]]
    ${VMId},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Save-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VHD {
[CmdletBinding(DefaultParameterSetName='Parent', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [Parameter(ParameterSetName='Parent', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ParentPath},

    [Parameter(ParameterSetName='Parent')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${LeafPath},

    [Parameter(ParameterSetName='PhysicalSectorSize', Mandatory=$true)]
    [ValidateSet('512','4096')]
    [ValidateNotNullOrEmpty()]
    [uint32]
    ${PhysicalSectorSizeBytes},

    [Parameter(ParameterSetName='DiskIdentifier', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [switch]
    ${ResetDiskIdentifier},

    [Parameter(ParameterSetName='DiskIdentifier')]
    [switch]
    ${Force},

    [Parameter(ParameterSetName='Parent')]
    [switch]
    ${IgnoreIdMismatch},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Set-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [bool]
    ${GuestControlledCacheTypes},

    [uint32]
    ${LowMemoryMappedIoSpace},

    [uint64]
    ${HighMemoryMappedIoSpace},

    [bool]
    ${BatteryPassthroughEnabled},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${ProcessorCount},

    [switch]
    ${DynamicMemory},

    [switch]
    ${StaticMemory},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${MemoryMinimumBytes},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${MemoryMaximumBytes},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${MemoryStartupBytes},

    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.StartAction]]
    ${AutomaticStartAction},

    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.StopAction]]
    ${AutomaticStopAction},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${AutomaticStartDelay},

    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.CriticalErrorAction]]
    ${AutomaticCriticalErrorAction},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${AutomaticCriticalErrorActionTimeout},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${AutomaticCheckpointsEnabled},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${LockOnDisconnect},

    [ValidateNotNull()]
    [string]
    ${Notes},

    [ValidateNotNullOrEmpty()]
    [string]
    ${NewVMName},

    [ValidateNotNullOrEmpty()]
    [string]
    ${SnapshotFileLocation},

    [ValidateNotNullOrEmpty()]
    [string]
    ${SmartPagingFilePath},

    [System.Nullable[Microsoft.HyperV.PowerShell.CheckpointType]]
    ${CheckpointType},

    [System.Nullable[Microsoft.HyperV.PowerShell.EnhancedSessionTransportType]]
    ${EnhancedSessionTransportType},

    [switch]
    ${Passthru},

    [switch]
    ${AllowUnverifiedPaths})

process {throw "Should not be called."}}


function Set-VMBios {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMBios', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMBios[]]
    ${VMBios},

    [switch]
    ${DisableNumLock},

    [switch]
    ${EnableNumLock},

    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.BootDevice[]]
    ${StartupOrder},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMComPort {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMComPort', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMComPort[]]
    ${VMComPort},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
    [ValidateRange(1, 2)]
    [int]
    ${Number},

    [Parameter(Position=2)]
    [AllowEmptyString()]
    [AllowNull()]
    [string]
    ${Path},

    [Microsoft.HyperV.PowerShell.OnOffState]
    ${DebuggerMode},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMDvdDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.DvdDrive[]]
    ${VMDvdDrive},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='VMName', Position=1)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMName', Position=2)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ToControllerNumber},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ToControllerLocation},

    [Parameter(Position=3)]
    [string]
    ${Path},

    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [switch]
    ${AllowUnverifiedPaths},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMFibreChannelHba {
[CmdletBinding(DefaultParameterSetName='VMName And Only SAN', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName And Generate WWN')]
    [Parameter(ParameterSetName='VMName And Manual WWN')]
    [Parameter(ParameterSetName='VMName And Only SAN')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName And Generate WWN')]
    [Parameter(ParameterSetName='VMName And Manual WWN')]
    [Parameter(ParameterSetName='VMName And Only SAN')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName And Only SAN')]
    [Parameter(ParameterSetName='VMName And Generate WWN')]
    [Parameter(ParameterSetName='VMName And Manual WWN')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Object And Manual WWN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='Object And Generate WWN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='Object And Only SAN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMFibreChannelHba]
    ${VMFibreChannelHba},

    [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=1)]
    [Alias('Wwnn1')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWideNodeNameSetA},

    [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=2)]
    [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=2)]
    [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=2)]
    [Alias('Wwpn1')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWidePortNameSetA},

    [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=3)]
    [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=3)]
    [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=3)]
    [Alias('Wwnn2')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWideNodeNameSetB},

    [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=4)]
    [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=4)]
    [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=4)]
    [Alias('Wwpn2')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${WorldWidePortNameSetB},

    [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true)]
    [Parameter(ParameterSetName='Object And Generate WWN', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [switch]
    ${GenerateWwn},

    [Parameter(ParameterSetName='Object And Only SAN', Mandatory=$true)]
    [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SanName},

    [Parameter(ParameterSetName='Object And Manual WWN')]
    [Parameter(ParameterSetName='VMName And Manual WWN')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewWorldWideNodeNameSetA},

    [Parameter(ParameterSetName='Object And Manual WWN')]
    [Parameter(ParameterSetName='VMName And Manual WWN')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewWorldWidePortNameSetA},

    [Parameter(ParameterSetName='VMName And Manual WWN')]
    [Parameter(ParameterSetName='Object And Manual WWN')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewWorldWideNodeNameSetB},

    [Parameter(ParameterSetName='Object And Manual WWN')]
    [Parameter(ParameterSetName='VMName And Manual WWN')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewWorldWidePortNameSetB},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMFirmware {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMFirmware', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMFirmware[]]
    ${VMFirmware},

    [Microsoft.HyperV.PowerShell.VMComponentObject[]]
    ${BootOrder},

    [Microsoft.HyperV.PowerShell.VMComponentObject]
    ${FirstBootDevice},

    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${EnableSecureBoot},

    [string]
    ${SecureBootTemplate},

    [System.Nullable[guid]]
    ${SecureBootTemplateId},

    [System.Nullable[Microsoft.HyperV.PowerShell.IPProtocolPreference]]
    ${PreferredNetworkBootProtocol},

    [System.Nullable[Microsoft.HyperV.PowerShell.ConsoleModeType]]
    ${ConsoleMode},

    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${PauseAfterBootFailure},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMFloppyDiskDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMFloppyDiskDrive', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMFloppyDiskDrive[]]
    ${VMFloppyDiskDrive},

    [Parameter(Position=1, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [string]
    ${Path},

    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMGpuPartitionAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMGpuPartitionAdapter[]]
    ${VMGpuPartitionAdapter},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${AdapterId},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MinPartitionVRAM},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MaxPartitionVRAM},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${OptimalPartitionVRAM},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MinPartitionEncode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MaxPartitionEncode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${OptimalPartitionEncode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MinPartitionDecode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MaxPartitionDecode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${OptimalPartitionDecode},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MinPartitionCompute},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${MaxPartitionCompute},

    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${OptimalPartitionCompute})

process {throw "Should not be called."}}


function Set-VMHardDiskDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='Object', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='Object')]
    [Alias('PSComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='Object')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.HardDiskDrive[]]
    ${VMHardDiskDrive},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='VMName', Position=1)]
    [Microsoft.HyperV.PowerShell.ControllerType]
    ${ControllerType},

    [Parameter(ParameterSetName='VMName', Position=2)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMName', Position=3)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [Parameter(Position=4)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Path},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.ControllerType]]
    ${ToControllerType},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ToControllerNumber},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ToControllerLocation},

    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [Alias('Number')]
    [uint32]
    ${DiskNumber},

    [ValidateNotNull()]
    [string]
    ${ResourcePoolName},

    [Alias('ShareVirtualDisk')]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[bool]]
    ${SupportPersistentReservations},

    [switch]
    ${AllowUnverifiedPaths},

    [System.Nullable[uint64]]
    ${MaximumIOPS},

    [System.Nullable[uint64]]
    ${MinimumIOPS},

    [string]
    ${QoSPolicyID},

    [ciminstance]
    ${QoSPolicy},

    [switch]
    ${Passthru},

    [System.Nullable[Microsoft.HyperV.PowerShell.CacheAttributes]]
    ${OverrideCacheAttributes})

process {throw "Should not be called."}}


function Set-VMHost {
[CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [uint32]
    ${MaximumStorageMigrations},

    [uint32]
    ${MaximumVirtualMachineMigrations},

    [Microsoft.HyperV.PowerShell.MigrationAuthenticationType]
    ${VirtualMachineMigrationAuthenticationType},

    [bool]
    ${UseAnyNetworkForMigration},

    [Microsoft.HyperV.PowerShell.VMMigrationPerformance]
    ${VirtualMachineMigrationPerformanceOption},

    [ValidateNotNull()]
    [System.Nullable[timespan]]
    ${ResourceMeteringSaveInterval},

    [ValidateNotNullOrEmpty()]
    [string]
    ${VirtualHardDiskPath},

    [ValidateNotNullOrEmpty()]
    [string]
    ${VirtualMachinePath},

    [ValidateNotNullOrEmpty()]
    [string]
    ${MacAddressMaximum},

    [ValidateNotNullOrEmpty()]
    [string]
    ${MacAddressMinimum},

    [ValidateNotNullOrEmpty()]
    [string]
    ${FibreChannelWwnn},

    [ValidateNotNullOrEmpty()]
    [string]
    ${FibreChannelWwpnMaximum},

    [ValidateNotNullOrEmpty()]
    [string]
    ${FibreChannelWwpnMinimum},

    [System.Nullable[bool]]
    ${NumaSpanningEnabled},

    [System.Nullable[bool]]
    ${EnableEnhancedSessionMode},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMHostCluster {
[CmdletBinding(DefaultParameterSetName='ClusterName')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ClusterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ClusterName},

    [Parameter(ParameterSetName='ClusterName', Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='InputObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMHostCluster[]]
    ${InputObject},

    [ValidateNotNullOrEmpty()]
    [string]
    ${SharedStoragePath},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMKeyProtector {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru},

    [byte[]]
    ${KeyProtector},

    [switch]
    ${NewLocalKeyProtector},

    [switch]
    ${RestoreLastKnownGoodKeyProtector})

process {throw "Should not be called."}}


function Set-VMKeyStorageDrive {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.KeyStorageDrive[]]
    ${VMKeyStorageDrive},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='VMName', Position=1)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerNumber},

    [Parameter(ParameterSetName='VMName', Position=2)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ControllerLocation},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ToControllerNumber},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${ToControllerLocation},

    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [switch]
    ${AllowUnverifiedPaths},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMMemory {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMMemory[]]
    ${VMMemory},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${Buffer},

    [bool]
    ${DynamicMemoryEnabled},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${MaximumBytes},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${StartupBytes},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${MinimumBytes},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${Priority},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${MaximumAmountPerNumaNodeBytes},

    [ValidateNotNull()]
    [string]
    ${ResourcePoolName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMMigrationNetwork {
[CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='CimSession', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Subnet},

    [Parameter(Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NewSubnet},

    [ValidateNotNullOrEmpty()]
    [uint32]
    ${NewPriority},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMNetworkAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Alias('VMNetworkAdapterName')]
    [string]
    ${Name},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourceObject')]
    [switch]
    ${DynamicMacAddress},

    [ValidateNotNull()]
    [uint32]
    ${MediaType},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${NumaAwarePlacement},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${InterruptModeration},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourceObject')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StaticMacAddress},

    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${MacAddressSpoofing},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${DhcpGuard},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${RouterGuard},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMNetworkAdapterPortMirroringMode]]
    ${PortMirroring},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${IeeePriorityTag},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${VmqWeight},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${IovQueuePairsRequested},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.IovInterruptModerationValue]]
    ${IovInterruptModeration},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${IovWeight},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${IPsecOffloadMaximumSecurityAssociation},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${MaximumBandwidth},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${MinimumBandwidthAbsolute},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${MinimumBandwidthWeight},

    [string[]]
    ${MandatoryFeatureId},

    [ValidateNotNullOrEmpty()]
    [string]
    ${ResourcePoolName},

    [string]
    ${TestReplicaPoolName},

    [string]
    ${TestReplicaSwitchName},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${VirtualSubnetId},

    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${AllowTeaming},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${NotMonitoredInCluster},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${StormLimit},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${DynamicIPAddressLimit},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${DeviceNaming},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${FixSpeed10G},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${PacketDirectNumProcs},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${PacketDirectModerationCount},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${PacketDirectModerationInterval},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${VrssEnabled},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${VmmqEnabled},

    [Alias('VmmqQueuePairs')]
    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${VrssMaxQueuePairs},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${VrssMinQueuePairs},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType]]
    ${VrssQueueSchedulingMode},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${VrssExcludePrimaryProcessor},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${VrssIndependentHostSpreading},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VrssVmbusChannelAffinityPolicyType]]
    ${VrssVmbusChannelAffinityPolicy},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMNetworkAdapterFailoverConfiguration {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapter]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [string]
    ${VMNetworkAdapterName},

    [string]
    ${IPv4Address},

    [string]
    ${IPv6Address},

    [string]
    ${IPv4SubnetMask},

    [ValidateRange(0, 128)]
    [System.Nullable[int]]
    ${IPv6SubnetPrefixLength},

    [string]
    ${IPv4PreferredDNSServer},

    [string]
    ${IPv4AlternateDNSServer},

    [string]
    ${IPv6PreferredDNSServer},

    [string]
    ${IPv6AlternateDNSServer},

    [string]
    ${IPv4DefaultGateway},

    [string]
    ${IPv6DefaultGateway},

    [ValidateNotNull()]
    [switch]
    ${ClearFailoverIPv4Settings},

    [ValidateNotNull()]
    [switch]
    ${ClearFailoverIPv6Settings},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMNetworkAdapterIsolation {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationMode]]
    ${IsolationMode},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${AllowUntaggedTraffic},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${DefaultIsolationID},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
    ${MultiTenantStack},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMNetworkAdapterRdma {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [Alias('VMNetworkAdapterName')]
    [string]
    ${Name},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${RdmaWeight},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMNetworkAdapterRoutingDomainMapping {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='InputObjectParameter', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting]
    ${InputObject},

    [Parameter(ParameterSetName='ResourceObject')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [guid]
    ${RoutingDomainID},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourceObject')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${RoutingDomainName},

    [ValidateNotNullOrEmpty()]
    [string]
    ${NewRoutingDomainName},

    [ValidateNotNullOrEmpty()]
    [int[]]
    ${IsolationID},

    [string[]]
    ${IsolationName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMNetworkAdapterTeamMapping {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ManagementOS')]
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SwitchName},

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${PhysicalNetAdapterName},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMNetworkAdapterVlan {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
    [switch]
    ${ManagementOS},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [string]
    ${VMNetworkAdapterName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ManagementOS')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Alias('u')]
    [switch]
    ${Untagged},

    [Alias('a')]
    [switch]
    ${Access},

    [Alias('AccessVlanId')]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${VlanId},

    [Alias('t')]
    [switch]
    ${Trunk},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${NativeVlanId},

    [string]
    ${AllowedVlanIdList},

    [Alias('i')]
    [switch]
    ${Isolated},

    [Alias('c')]
    [switch]
    ${Community},

    [Alias('p')]
    [switch]
    ${Promiscuous},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${PrimaryVlanId},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${SecondaryVlanId},

    [string]
    ${SecondaryVlanIdList},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMPartitionableGpu {
[CmdletBinding(DefaultParameterSetName='ComputerName')]
param(
    [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ComputerName', Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='ComputerName', Position=1)]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMPartitionableGpu[]]
    ${PartitionableGpu},

    [switch]
    ${Passthru},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [ValidateNotNullOrEmpty()]
    [System.Nullable[uint16]]
    ${PartitionCount})

process {throw "Should not be called."}}


function Set-VMProcessor {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMProcessor', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMProcessor[]]
    ${VMProcessor},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${Count},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${CompatibilityForMigrationEnabled},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${CompatibilityForOlderOperatingSystemsEnabled},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${HwThreadCountPerCore},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${Maximum},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${Reserve},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${RelativeWeight},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${MaximumCountPerNumaNode},

    [ValidateNotNull()]
    [System.Nullable[int]]
    ${MaximumCountPerNumaSocket},

    [ValidateNotNull()]
    [string]
    ${ResourcePoolName},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${EnableHostResourceProtection},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${ExposeVirtualizationExtensions},

    [string[]]
    ${Perfmon},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMRemoteFx3dVideoAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter[]]
    ${VMRemoteFx3dVideoAdapter},

    [Parameter(Position=1)]
    [ValidateNotNull()]
    [System.Nullable[byte]]
    ${MonitorCount},

    [Parameter(Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${MaximumResolution},

    [Parameter(Position=3)]
    [ValidateNotNull()]
    [System.Nullable[uint64]]
    ${VRAMSizeBytes},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMReplication {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplication[]]
    ${VMReplication},

    [Parameter(Position=1)]
    [Alias('ReplicaServer')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ReplicaServerName},

    [Parameter(Position=2)]
    [Alias('ReplicaPort')]
    [ValidateNotNull()]
    [ValidateRange(1, 65535)]
    [System.Nullable[int]]
    ${ReplicaServerPort},

    [Parameter(Position=3)]
    [Alias('AuthType')]
    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.ReplicationAuthenticationType]]
    ${AuthenticationType},

    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [Alias('Thumbprint','Cert')]
    [string]
    ${CertificateThumbprint},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${CompressionEnabled},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${ReplicateHostKvpItems},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${BypassProxyServer},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${EnableWriteOrderPreservationAcrossDisks},

    [Alias('IRTime')]
    [ValidateNotNull()]
    [System.Nullable[datetime]]
    ${InitialReplicationStartTime},

    [Alias('DisableVSS')]
    [switch]
    ${DisableVSSSnapshotReplication},

    [Alias('VSSFreq')]
    [ValidateRange(1, 12)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${VSSSnapshotFrequencyHour},

    [Alias('RecHist')]
    [ValidateRange(0, 24)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${RecoveryHistory},

    [Alias('RepFreq')]
    [ValidateRange(30, 900)]
    [System.Nullable[int]]
    ${ReplicationFrequencySec},

    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.HardDiskDrive[]]
    ${ReplicatedDisks},

    [ValidateNotNull()]
    [string[]]
    ${ReplicatedDiskPaths},

    [switch]
    ${Reverse},

    [Alias('AutoResync')]
    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${AutoResynchronizeEnabled},

    [Alias('AutoResyncStart')]
    [ValidateNotNull()]
    [System.Nullable[timespan]]
    ${AutoResynchronizeIntervalStart},

    [Alias('AutoResyncEnd')]
    [ValidateNotNull()]
    [System.Nullable[timespan]]
    ${AutoResynchronizeIntervalEnd},

    [switch]
    ${AsReplica},

    [switch]
    ${UseBackup},

    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [Alias('AllowedPS')]
    [string]
    ${AllowedPrimaryServer},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMReplicationAuthorizationEntry {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMRepAuthEntry')]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplicationAuthorizationEntry[]]
    ${VMReplicationAuthorizationEntry},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('AllowedPS')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${AllowedPrimaryServer},

    [Parameter(Position=1)]
    [Alias('StorageLoc')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ReplicaStorageLocation},

    [Parameter(Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${TrustGroup},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMReplicationServer {
[CmdletBinding(DefaultParameterSetName='AuthenticationPort', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Position=0)]
    [Alias('RepEnabled')]
    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${ReplicationEnabled},

    [Parameter(Position=1)]
    [Alias('AuthType')]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.RecoveryAuthenticationType]
    ${AllowedAuthenticationType},

    [Parameter(Position=2)]
    [Alias('AllowAnyServer')]
    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${ReplicationAllowedFromAnyServer},

    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [Alias('Thumbprint')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${CertificateThumbprint},

    [Alias('StorageLoc')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DefaultStorageLocation},

    [Parameter(ParameterSetName='AuthenticationPort')]
    [Alias('KerbAuthPort')]
    [ValidateRange(1, 65535)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${KerberosAuthenticationPort},

    [Parameter(ParameterSetName='AuthenticationPort')]
    [Alias('CertAuthPort')]
    [ValidateRange(1, 65535)]
    [ValidateNotNull()]
    [System.Nullable[int]]
    ${CertificateAuthenticationPort},

    [Parameter(ParameterSetName='AuthenticationPortMapping')]
    [ValidateNotNull()]
    [hashtable]
    ${KerberosAuthenticationPortMapping},

    [Parameter(ParameterSetName='AuthenticationPortMapping')]
    [ValidateNotNull()]
    [hashtable]
    ${CertificateAuthenticationPortMapping},

    [ValidateNotNull()]
    [System.Nullable[timespan]]
    ${MonitoringInterval},

    [ValidateNotNull()]
    [System.Nullable[timespan]]
    ${MonitoringStartTime},

    [switch]
    ${Force},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Set-VMResourcePool {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [Microsoft.HyperV.PowerShell.VMResourcePoolType]
    ${ResourcePoolType},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ParentName},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Set-VMSan {
[CmdletBinding(DefaultParameterSetName='HbaObject', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='StringWwn')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='StringWwn')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('SanName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Name},

    [Parameter(ParameterSetName='HbaObject')]
    [ValidateNotNullOrEmpty()]
    [ciminstance[]]
    ${HostBusAdapter},

    [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
    [Alias('Wwnn','NodeName','Wwnns','NodeNames','WorldWideNodeNames','NodeAddress')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${WorldWideNodeName},

    [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
    [Alias('Wwpn','PortName','Wwpns','PortNames','WorldWidePortNames','PortAddress')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${WorldWidePortName},

    [ValidateNotNull()]
    [string]
    ${Note},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMSecurity {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru},

    [bool]
    ${EncryptStateAndVmMigrationTraffic},

    [bool]
    ${VirtualizationBasedSecurityOptOut})

process {throw "Should not be called."}}


function Set-VMSecurityPolicy {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru},

    [bool]
    ${Shielded},

    [bool]
    ${BindToHostTpm})

process {throw "Should not be called."}}


function Set-VMStorageSettings {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [switch]
    ${Passthru},

    [bool]
    ${DisableInterruptBatching},

    [Microsoft.HyperV.PowerShell.ThreadCount]
    ${ThreadCountPerChannel},

    [uint16]
    ${VirtualProcessorsPerChannel})

process {throw "Should not be called."}}


function Set-VMSwitch {
[CmdletBinding(DefaultParameterSetName='SwitchName_SwitchType', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchName_SwitchType', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
    [Parameter(ParameterSetName='SwitchObject_SwitchType')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
    [Parameter(ParameterSetName='SwitchName_SwitchType')]
    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
    [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
    [Parameter(ParameterSetName='SwitchObject_SwitchType')]
    [Alias('PSComputerName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SwitchName_SwitchType')]
    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
    [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
    [Parameter(ParameterSetName='SwitchObject_SwitchType')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='SwitchObject_SwitchType', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [Parameter(ParameterSetName='SwitchName_SwitchType', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=0)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [Alias('InterfaceAlias')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NetAdapterName},

    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${NetAdapterInterfaceDescription},

    [Parameter(ParameterSetName='SwitchName_SwitchType')]
    [Parameter(ParameterSetName='SwitchObject_SwitchType')]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMSwitchType]]
    ${SwitchType},

    [System.Nullable[bool]]
    ${AllowManagementOS},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${DefaultFlowMinimumBandwidthAbsolute},

    [ValidateNotNull()]
    [System.Nullable[long]]
    ${DefaultFlowMinimumBandwidthWeight},

    [System.Nullable[bool]]
    ${DefaultQueueVrssEnabled},

    [System.Nullable[bool]]
    ${DefaultQueueVmmqEnabled},

    [Alias('DefaultQueueVmmqQueuePairs')]
    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${DefaultQueueVrssMaxQueuePairs},

    [ValidateNotNull()]
    [System.Nullable[uint32]]
    ${DefaultQueueVrssMinQueuePairs},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType]]
    ${DefaultQueueVrssQueueSchedulingMode},

    [System.Nullable[bool]]
    ${DefaultQueueVrssExcludePrimaryProcessor},

    [System.Nullable[bool]]
    ${EnableSoftwareRsc},

    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
    ${Extensions},

    [ValidateNotNull()]
    [string]
    ${Notes},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Set-VMSwitchExtensionPortFeature {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature[]]
    ${VMSwitchExtensionFeature},

    [switch]
    ${Passthru},

    [string[]]
    ${VMName},

    [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
    ${VMNetworkAdapter},

    [switch]
    ${ManagementOS},

    [switch]
    ${ExternalPort},

    [string]
    ${SwitchName},

    [string]
    ${VMNetworkAdapterName},

    [string[]]
    ${ComputerName},

    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Set-VMSwitchExtensionSwitchFeature {
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature[]]
    ${VMSwitchExtensionFeature},

    [switch]
    ${Passthru},

    [string[]]
    ${ComputerName},

    [string[]]
    ${SwitchName},

    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Set-VMSwitchTeam {
[CmdletBinding(DefaultParameterSetName='SwitchName_NetAdapterName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='SwitchName_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
    [Alias('PSComputerName')]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMSwitch[]]
    ${VMSwitch},

    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=0)]
    [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=0)]
    [Alias('SwitchName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
    [Alias('InterfaceAlias')]
    [string[]]
    ${NetAdapterName},

    [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
    [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
    [string[]]
    ${NetAdapterInterfaceDescription},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMSwitchTeamingMode]]
    ${TeamingMode},

    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMSwitchLoadBalancingAlgorithm]]
    ${LoadBalancingAlgorithm},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Set-VMVideo {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMVideo', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VMVideo[]]
    ${VMVideo},

    [Parameter(Position=1)]
    [ValidateNotNull()]
    [System.Nullable[Microsoft.HyperV.PowerShell.ResolutionType]]
    ${ResolutionType},

    [Parameter(Position=2)]
    [ValidateNotNull()]
    [System.Nullable[uint16]]
    ${HorizontalResolution},

    [Parameter(Position=3)]
    [ValidateNotNull()]
    [System.Nullable[uint16]]
    ${VerticalResolution},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Start-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Start-VMFailover {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMName_Test')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMName_Test')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMName_Test')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMName_Test', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMObject_Test', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='VMSnapshot_Test', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMRecoveryCheckpoint')]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMSnapshot]
    ${VMRecoverySnapshot},

    [Parameter(ParameterSetName='VMSnapshot_Test', Mandatory=$true)]
    [Parameter(ParameterSetName='VMName_Test', Mandatory=$true)]
    [Parameter(ParameterSetName='VMObject_Test', Mandatory=$true)]
    [switch]
    ${AsTest},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [switch]
    ${Prepare},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Start-VMInitialReplication {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplication[]]
    ${VMReplication},

    [Alias('IRLoc')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationPath},

    [Alias('IRTime')]
    [ValidateNotNullOrEmpty()]
    [System.Nullable[datetime]]
    ${InitialReplicationStartTime},

    [switch]
    ${UseBackup},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Start-VMTrace {
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateSet('Error','Warning','Info','Verbose')]
    [System.Diagnostics.TraceLevel]
    ${Level},

    [switch]
    ${TraceVerboseObjects},

    [string]
    ${Path})

process {throw "Should not be called."}}


function Stop-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${Save},

    [switch]
    ${TurnOff},

    [switch]
    ${Force},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Stop-VMFailover {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Stop-VMInitialReplication {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplication[]]
    ${VMReplication},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Stop-VMReplication {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplication[]]
    ${VMReplication},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('Relationship')]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
    ${ReplicationRelationshipType},

    [switch]
    ${Passthru},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Stop-VMTrace {
[CmdletBinding()]
param()

process {throw "Should not be called."}}


function Suspend-VM {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Suspend-VMReplication {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${VMName},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Microsoft.HyperV.PowerShell.VMReplication[]]
    ${VMReplication},

    [Parameter(ParameterSetName='VMName')]
    [Alias('Relationship')]
    [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
    ${ReplicationRelationshipType},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Test-VHD {
[CmdletBinding(DefaultParameterSetName='ExistingVHD')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='SharedDisk', Mandatory=$true)]
    [Alias('ShareVirtualDisk')]
    [switch]
    ${SupportPersistentReservations},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Test-VMNetworkAdapter {
[CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='VMName')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VMName},

    [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Microsoft.HyperV.PowerShell.VMNetworkAdapter]
    ${VMNetworkAdapter},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine]
    ${VM},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Alias('VMNetworkAdapterName')]
    [string]
    ${Name},

    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='ResourceObject')]
    [switch]
    ${Sender},

    [Parameter(ParameterSetName='VMObject')]
    [Parameter(ParameterSetName='VMName')]
    [Parameter(ParameterSetName='ResourceObject')]
    [switch]
    ${Receiver},

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SenderIPAddress},

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ReceiverIPAddress},

    [string]
    ${NextHopMacAddress},

    [System.Nullable[int]]
    ${IsolationId},

    [Parameter(Mandatory=$true)]
    [int]
    ${SequenceNumber},

    [System.Nullable[int]]
    ${PayloadSize},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Test-VMReplicationConnection {
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0)]
    [Alias('ReplicaServer')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ReplicaServerName},

    [Parameter(Mandatory=$true, Position=1)]
    [Alias('ReplicaPort')]
    [ValidateRange(1, 65535)]
    [int]
    ${ReplicaServerPort},

    [Parameter(Mandatory=$true, Position=2)]
    [Alias('AuthType')]
    [Microsoft.HyperV.PowerShell.ReplicationAuthenticationType]
    ${AuthenticationType},

    [Parameter(Position=3, ValueFromPipelineByPropertyName=$true)]
    [Alias('Thumbprint')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${CertificateThumbprint},

    [ValidateNotNull()]
    [System.Nullable[bool]]
    ${BypassProxyServer},

    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential})

process {throw "Should not be called."}}


function Update-VMVersion {
[CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [switch]
    ${Force},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru})

process {throw "Should not be called."}}


function Wait-VM {
[CmdletBinding(DefaultParameterSetName='Name')]
param(
    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${ComputerName},

    [Parameter(ParameterSetName='Name')]
    [ValidateNotNullOrEmpty()]
    [pscredential[]]
    ${Credential},

    [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.HyperV.PowerShell.VirtualMachine[]]
    ${VM},

    [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('VMName')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${Name},

    [switch]
    ${AsJob},

    [switch]
    ${Passthru},

    [Microsoft.HyperV.PowerShell.WaitVMTypes]
    ${For},

    [ValidateRange(1, 65535)]
    [uint16]
    ${Delay},

    [Alias('TimeoutSec')]
    [ValidateRange(-1, 2147483647)]
    [int]
    ${Timeout})

process {throw "Should not be called."}}

