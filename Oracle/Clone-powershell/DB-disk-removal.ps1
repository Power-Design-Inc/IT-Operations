$user = 'administrator@vsphere.local'
$pass = 'm0G!Qx615GX&y^vHmtZs'
$myvcenter = 'pdivcsa-02.powerdesigninc.us'
Connect-VIServer -Server $myvcenter -Protocol https -User $user -Password $pass
Start-Sleep -s 1

#---------------EnvironmentBrowser---------------
$_this = Get-View -Id 'VirtualMachine-vm-621'
$_this.EnvironmentBrowser
#---------------Config---------------
$_this = Get-View -Id 'VirtualMachine-vm-621'
$_this.Config
#---------------QueryConfigOptionEx---------------
$spec = New-Object VMware.Vim.EnvironmentBrowserConfigOptionQuerySpec
$spec.GuestId = New-Object String[] (1)
$spec.GuestId[0] = 'oracleLinux6_64Guest'
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-621'
$_this.QueryConfigOptionEx($spec)
#---------------DatastoreBrowser---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-621'
$_this.DatastoreBrowser
#---------------QueryTargetCapabilities---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-621'
$_this.QueryTargetCapabilities($null)
#---------------QueryConfigOptionDescriptor---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-621'
$_this.QueryConfigOptionDescriptor()
#---------------ListKmipServers---------------
$_this = Get-View -Id 'CryptoManagerKmip-CryptoManager'
$_this.ListKmipServers($null)
#---------------ReconfigVM_Task---------------
$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.DeviceChange = New-Object VMware.Vim.VirtualDeviceConfigSpec[] (5)
$spec.DeviceChange[0] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[0].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[0].Device.Key = 2001
$spec.DeviceChange[0].Operation = 'remove'
$spec.DeviceChange[1] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[1].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[1].Device.Key = 2002
$spec.DeviceChange[1].Operation = 'remove'
$spec.DeviceChange[2] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[2].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[2].Device.Key = 2003
$spec.DeviceChange[2].Operation = 'remove'
$spec.DeviceChange[3] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[3].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[3].Device.Key = 2004
$spec.DeviceChange[3].Operation = 'remove'
$spec.DeviceChange[4] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[4].Device = New-Object VMware.Vim.VirtualDisk
$spec.DeviceChange[4].Device.Key = 2006
$spec.DeviceChange[4].Operation = 'remove'
$spec.CpuFeatureMask = New-Object VMware.Vim.VirtualMachineCpuIdInfoSpec[] (0)
$_this = Get-View -Id 'VirtualMachine-vm-621'
$_this.ReconfigVM_Task($spec)
#---------------QueryConfigOptionDescriptor---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-621'
$_this.QueryConfigOptionDescriptor()
#---------------EnvironmentBrowser---------------
$_this = Get-View -Id 'VirtualMachine-vm-621'
$_this.EnvironmentBrowser
#---------------QueryConfigOptionEx---------------
$_this = Get-View -Id 'EnvironmentBrowser-envbrowser-621'
$_this.QueryConfigOptionEx($null)