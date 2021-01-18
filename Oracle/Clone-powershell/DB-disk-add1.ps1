#----------------- Start of code capture -----------------

<#
.SYNOPSIS
Gets VI server connection by a given server uuid.

.DESCRIPTION
Gets VI server connection by a given server instance uuid from the default connected VI servers collection.
#>
function Get-VcConnection([string]$VcInstanceUuid) {
    $DefaultVIServers | Where-Object {$_.InstanceUuid -eq $vcInstanceUuid}
}

#---------------EnvironmentBrowser---------------
$_this = Get-View -Id 'VirtualMachine-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.EnvironmentBrowser
#---------------Config---------------
$_this = Get-View -Id 'VirtualMachine-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.Config
#---------------QueryConfigOptionEx---------------
$spec = New-Object VMware.Vim.EnvironmentBrowserConfigOptionQuerySpec
$spec.GuestId = New-Object String[] (1)
$spec.GuestId[0] = 'oracleLinux6_64Guest'
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.QueryConfigOptionEx($spec)
#---------------DatastoreBrowser---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.DatastoreBrowser
#---------------QueryTargetCapabilities---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.QueryTargetCapabilities($null)
#---------------QueryConfigOptionDescriptor---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.QueryConfigOptionDescriptor()
#---------------ListKmipServers---------------
$_this = Get-View -Id 'CryptoManagerKmip-CryptoManager' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.ListKmipServers($null)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB2]'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.VmDiskFileQuery
$searchSpec.Query[0].Details = New-Object VMware.Vim.VmDiskFileQueryFlags
$searchSpec.Query[0].Details.CapacityKb = $true
$searchSpec.Query[0].Details.Encryption = $true
$searchSpec.Query[0].Details.HardwareVersion = $true
$searchSpec.Query[0].Details.DiskType = $true
$searchSpec.Query[0].Details.Thin = $true
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB2]'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.FolderFileQuery
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------CurrentTime---------------
$_this = Get-View -Id 'ServiceInstance-ServiceInstance' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.CurrentTime()
#---------------CurrentTime---------------
$_this = Get-View -Id 'ServiceInstance-ServiceInstance' -Server (Get-VcConnection -VcInstanceUuid '05ec7a25-d91f-4d5b-8999-cb57b466b371')
$_this.CurrentTime()
#---------------CurrentTime---------------
$_this = Get-View -Id 'ServiceInstance-ServiceInstance' -Server (Get-VcConnection -VcInstanceUuid '1e6e60c9-6e94-4cc8-b25a-2891c9c6c299')
$_this.CurrentTime()
#---------------CurrentTime---------------
$_this = Get-View -Id 'ServiceInstance-ServiceInstance' -Server (Get-VcConnection -VcInstanceUuid 'bae84b13-1988-4167-8595-2de13422afe2')
$_this.CurrentTime()
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB2] PDIVLORACLDB'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.VmDiskFileQuery
$searchSpec.Query[0].Details = New-Object VMware.Vim.VmDiskFileQueryFlags
$searchSpec.Query[0].Details.CapacityKb = $true
$searchSpec.Query[0].Details.Encryption = $true
$searchSpec.Query[0].Details.HardwareVersion = $true
$searchSpec.Query[0].Details.DiskType = $true
$searchSpec.Query[0].Details.Thin = $true
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB3]'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.FolderFileQuery
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB3] PDIVLORACLDB'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.VmDiskFileQuery
$searchSpec.Query[0].Details = New-Object VMware.Vim.VmDiskFileQueryFlags
$searchSpec.Query[0].Details.CapacityKb = $true
$searchSpec.Query[0].Details.Encryption = $true
$searchSpec.Query[0].Details.HardwareVersion = $true
$searchSpec.Query[0].Details.DiskType = $true
$searchSpec.Query[0].Details.Thin = $true
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB4]'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.VmDiskFileQuery
$searchSpec.Query[0].Details = New-Object VMware.Vim.VmDiskFileQueryFlags
$searchSpec.Query[0].Details.CapacityKb = $true
$searchSpec.Query[0].Details.Encryption = $true
$searchSpec.Query[0].Details.HardwareVersion = $true
$searchSpec.Query[0].Details.DiskType = $true
$searchSpec.Query[0].Details.Thin = $true
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB4]'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.FolderFileQuery
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB4] PDIVLORACLDB'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.VmDiskFileQuery
$searchSpec.Query[0].Details = New-Object VMware.Vim.VmDiskFileQueryFlags
$searchSpec.Query[0].Details.CapacityKb = $true
$searchSpec.Query[0].Details.Encryption = $true
$searchSpec.Query[0].Details.HardwareVersion = $true
$searchSpec.Query[0].Details.DiskType = $true
$searchSpec.Query[0].Details.Thin = $true
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB5]'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.FolderFileQuery
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB5] PDIVLORACLDB'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.VmDiskFileQuery
$searchSpec.Query[0].Details = New-Object VMware.Vim.VmDiskFileQueryFlags
$searchSpec.Query[0].Details.CapacityKb = $true
$searchSpec.Query[0].Details.Encryption = $true
$searchSpec.Query[0].Details.HardwareVersion = $true
$searchSpec.Query[0].Details.DiskType = $true
$searchSpec.Query[0].Details.Thin = $true
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB6]'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.FolderFileQuery
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------SearchDatastore_Task---------------
$datastorePath = '[LAB05DB6] PDIVLORACLDB'
$searchSpec = New-Object VMware.Vim.HostDatastoreBrowserSearchSpec
$searchSpec.Query = New-Object VMware.Vim.FileQuery[] (1)
$searchSpec.Query[0] = New-Object VMware.Vim.VmDiskFileQuery
$searchSpec.Query[0].Details = New-Object VMware.Vim.VmDiskFileQueryFlags
$searchSpec.Query[0].Details.CapacityKb = $true
$searchSpec.Query[0].Details.Encryption = $true
$searchSpec.Query[0].Details.HardwareVersion = $true
$searchSpec.Query[0].Details.DiskType = $true
$searchSpec.Query[0].Details.Thin = $true
$searchSpec.Details = New-Object VMware.Vim.FileQueryFlags
$searchSpec.Details.FileSize = $true
$searchSpec.Details.FileOwner = $true
$searchSpec.Details.Modification = $true
$searchSpec.Details.FileType = $true
$searchSpec.SearchCaseInsensitive = $true
$searchSpec.SortFoldersFirst = $true
$_this = Get-View -Id 'HostDatastoreBrowser-datastoreBrowser-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.SearchDatastore_Task($datastorePath, $searchSpec)
#---------------ReconfigVM_Task---------------
$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.MemoryAllocation = New-Object VMware.Vim.ResourceAllocationInfo
$spec.MemoryAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.MemoryAllocation.Shares.Shares = 1000000
$spec.MemoryAllocation.Shares.Level = 'normal'
$spec.DeviceChange = New-Object VMware.Vim.VirtualDeviceConfigSpec[] (5)
$spec.DeviceChange[0] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[0].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[0].Device.CapacityInBytes = 214748364800
$spec.DeviceChange[0].Device.StorageIOAllocation = New-Object VMware.Vim.StorageIOAllocationInfo
$spec.DeviceChange[0].Device.StorageIOAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.DeviceChange[0].Device.StorageIOAllocation.Shares.Shares = 1000
$spec.DeviceChange[0].Device.StorageIOAllocation.Shares.Level = 'normal'
$spec.DeviceChange[0].Device.StorageIOAllocation.Limit = -1
$spec.DeviceChange[0].Device.Backing = New-Object VMware.Vim.VirtualDiskFlatVer2BackingInfo
$spec.DeviceChange[0].Device.Backing.FileName = '[LAB05DB2] PDIVLORACLDB/PDIVLORACLDB_9.vmdk'
$spec.DeviceChange[0].Device.Backing.EagerlyScrub = $false
$spec.DeviceChange[0].Device.Backing.ThinProvisioned = $false
$spec.DeviceChange[0].Device.Backing.DiskMode = 'persistent'
$spec.DeviceChange[0].Device.ControllerKey = 1000
$spec.DeviceChange[0].Device.UnitNumber = 1
$spec.DeviceChange[0].Device.CapacityInKB = 209715200
$spec.DeviceChange[0].Device.DeviceInfo = New-Object VMware.Vim.Description
$spec.DeviceChange[0].Device.DeviceInfo.Summary = 'New Hard disk'
$spec.DeviceChange[0].Device.DeviceInfo.Label = 'New Hard disk'
$spec.DeviceChange[0].Device.Key = -101
$spec.DeviceChange[0].Operation = 'add'
$spec.DeviceChange[1] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[1].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[1].Device.CapacityInBytes = 563714457600
$spec.DeviceChange[1].Device.StorageIOAllocation = New-Object VMware.Vim.StorageIOAllocationInfo
$spec.DeviceChange[1].Device.StorageIOAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.DeviceChange[1].Device.StorageIOAllocation.Shares.Shares = 1000
$spec.DeviceChange[1].Device.StorageIOAllocation.Shares.Level = 'normal'
$spec.DeviceChange[1].Device.StorageIOAllocation.Limit = -1
$spec.DeviceChange[1].Device.Backing = New-Object VMware.Vim.VirtualDiskFlatVer2BackingInfo
$spec.DeviceChange[1].Device.Backing.FileName = '[LAB05DB3] PDIVLORACLDB/PDIVLORACLDB_11.vmdk'
$spec.DeviceChange[1].Device.Backing.EagerlyScrub = $false
$spec.DeviceChange[1].Device.Backing.ThinProvisioned = $false
$spec.DeviceChange[1].Device.Backing.DiskMode = 'persistent'
$spec.DeviceChange[1].Device.ControllerKey = 1000
$spec.DeviceChange[1].Device.UnitNumber = 2
$spec.DeviceChange[1].Device.CapacityInKB = 550502400
$spec.DeviceChange[1].Device.DeviceInfo = New-Object VMware.Vim.Description
$spec.DeviceChange[1].Device.DeviceInfo.Summary = 'New Hard disk'
$spec.DeviceChange[1].Device.DeviceInfo.Label = 'New Hard disk'
$spec.DeviceChange[1].Device.Key = -102
$spec.DeviceChange[1].Operation = 'add'
$spec.DeviceChange[2] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[2].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[2].Device.CapacityInBytes = 2199023255552
$spec.DeviceChange[2].Device.StorageIOAllocation = New-Object VMware.Vim.StorageIOAllocationInfo
$spec.DeviceChange[2].Device.StorageIOAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.DeviceChange[2].Device.StorageIOAllocation.Shares.Shares = 1000
$spec.DeviceChange[2].Device.StorageIOAllocation.Shares.Level = 'normal'
$spec.DeviceChange[2].Device.StorageIOAllocation.Limit = -1
$spec.DeviceChange[2].Device.Backing = New-Object VMware.Vim.VirtualDiskFlatVer2BackingInfo
$spec.DeviceChange[2].Device.Backing.FileName = '[LAB05DB4] PDIVLORACLDB/PDIVLORACLDB_4.vmdk'
$spec.DeviceChange[2].Device.Backing.EagerlyScrub = $false
$spec.DeviceChange[2].Device.Backing.ThinProvisioned = $false
$spec.DeviceChange[2].Device.Backing.DiskMode = 'persistent'
$spec.DeviceChange[2].Device.ControllerKey = 1000
$spec.DeviceChange[2].Device.UnitNumber = 3
$spec.DeviceChange[2].Device.CapacityInKB = 2147483648
$spec.DeviceChange[2].Device.DeviceInfo = New-Object VMware.Vim.Description
$spec.DeviceChange[2].Device.DeviceInfo.Summary = 'New Hard disk'
$spec.DeviceChange[2].Device.DeviceInfo.Label = 'New Hard disk'
$spec.DeviceChange[2].Device.Key = -103
$spec.DeviceChange[2].Operation = 'add'
$spec.DeviceChange[3] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[3].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[3].Device.CapacityInBytes = 2199023255552
$spec.DeviceChange[3].Device.StorageIOAllocation = New-Object VMware.Vim.StorageIOAllocationInfo
$spec.DeviceChange[3].Device.StorageIOAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.DeviceChange[3].Device.StorageIOAllocation.Shares.Shares = 1000
$spec.DeviceChange[3].Device.StorageIOAllocation.Shares.Level = 'normal'
$spec.DeviceChange[3].Device.StorageIOAllocation.Limit = -1
$spec.DeviceChange[3].Device.Backing = New-Object VMware.Vim.VirtualDiskFlatVer2BackingInfo
$spec.DeviceChange[3].Device.Backing.FileName = '[LAB05DB5] PDIVLORACLDB/PDIVLORACLDB_7.vmdk'
$spec.DeviceChange[3].Device.Backing.EagerlyScrub = $false
$spec.DeviceChange[3].Device.Backing.ThinProvisioned = $false
$spec.DeviceChange[3].Device.Backing.DiskMode = 'persistent'
$spec.DeviceChange[3].Device.ControllerKey = 1000
$spec.DeviceChange[3].Device.UnitNumber = 4
$spec.DeviceChange[3].Device.CapacityInKB = 2147483648
$spec.DeviceChange[3].Device.DeviceInfo = New-Object VMware.Vim.Description
$spec.DeviceChange[3].Device.DeviceInfo.Summary = 'New Hard disk'
$spec.DeviceChange[3].Device.DeviceInfo.Label = 'New Hard disk'
$spec.DeviceChange[3].Device.Key = -104
$spec.DeviceChange[3].Operation = 'add'
$spec.DeviceChange[4] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[4].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[4].Device.CapacityInBytes = 2199023255552
$spec.DeviceChange[4].Device.StorageIOAllocation = New-Object VMware.Vim.StorageIOAllocationInfo
$spec.DeviceChange[4].Device.StorageIOAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.DeviceChange[4].Device.StorageIOAllocation.Shares.Shares = 1000
$spec.DeviceChange[4].Device.StorageIOAllocation.Shares.Level = 'normal'
$spec.DeviceChange[4].Device.StorageIOAllocation.Limit = -1
$spec.DeviceChange[4].Device.Backing = New-Object VMware.Vim.VirtualDiskFlatVer2BackingInfo
$spec.DeviceChange[4].Device.Backing.FileName = '[LAB05DB6] PDIVLORACLDB/PDIVLORACLDB_8.vmdk'
$spec.DeviceChange[4].Device.Backing.EagerlyScrub = $false
$spec.DeviceChange[4].Device.Backing.ThinProvisioned = $false
$spec.DeviceChange[4].Device.Backing.DiskMode = 'persistent'
$spec.DeviceChange[4].Device.ControllerKey = 1000
$spec.DeviceChange[4].Device.UnitNumber = 5
$spec.DeviceChange[4].Device.CapacityInKB = 2147483648
$spec.DeviceChange[4].Device.DeviceInfo = New-Object VMware.Vim.Description
$spec.DeviceChange[4].Device.DeviceInfo.Summary = 'New Hard disk'
$spec.DeviceChange[4].Device.DeviceInfo.Label = 'New Hard disk'
$spec.DeviceChange[4].Device.Key = -105
$spec.DeviceChange[4].Operation = 'add'
$spec.CpuFeatureMask = New-Object VMware.Vim.VirtualMachineCpuIdInfoSpec[] (0)
$_this = Get-View -Id 'VirtualMachine-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.ReconfigVM_Task($spec)
#---------------QueryConfigOptionDescriptor---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.QueryConfigOptionDescriptor()
#---------------EnvironmentBrowser---------------
$_this = Get-View -Id 'VirtualMachine-vm-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.EnvironmentBrowser
#---------------QueryConfigOptionEx---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-601' -Server (Get-VcConnection -VcInstanceUuid '4673ffeb-0d79-4dd0-addd-00c486d3e285')
$_this.QueryConfigOptionEx($null)

#----------------- End of code capture -----------------