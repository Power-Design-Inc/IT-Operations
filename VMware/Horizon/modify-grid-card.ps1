#
# Current as of PowerCLI 12 for Powershell 7 core
# Declare the variables to use in the script
# 
$user = 'administrator@horizon.local'
$pass = 'SpiceEmpire88!'
$myvcenter = 'pdivlvcenter.powerdesigninc.us'
$gridvm = 'VIEWGRIDCAD-005'
#$action = 'add'
$action = 'remove'

# Connect to the vCenter that you want to work with
# 
Connect-VIServer -Server $myvcenter -Protocol https -User $user -Password $pass
Start-Sleep -s 5

# Stops the local VM from Running
# 
Stop-VM -VM $gridvm -Confirm:$false
Start-Sleep -s 2

#---------------ReconfigVM_Task---------------
$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.DeviceChange = New-Object VMware.Vim.VirtualDeviceConfigSpec[] (1)
$spec.DeviceChange[0] = New-Object VMware.Vim.VirtualDeviceConfigSpec
$spec.DeviceChange[0].Device = New-Object VMware.Vim.VirtualPCIPassthrough
$spec.DeviceChange[0].Device.Backing = New-Object VMware.Vim.VirtualPCIPassthroughVmiopBackingInfo
$spec.DeviceChange[0].Device.Backing.Vgpu = 'grid_m60-2q'
$spec.DeviceChange[0].Device.ControllerKey = 100
$spec.DeviceChange[0].Device.UnitNumber = 18
$spec.DeviceChange[0].Device.SlotInfo = New-Object VMware.Vim.VirtualDevicePciBusSlotInfo
$spec.DeviceChange[0].Device.SlotInfo.PciSlotNumber = 34
$spec.DeviceChange[0].Device.DeviceInfo = New-Object VMware.Vim.Description
$spec.DeviceChange[0].Device.DeviceInfo.Summary = 'NVIDIA GRID vGPU grid_m60-2q'
$spec.DeviceChange[0].Device.DeviceInfo.Label = 'PCI device 0'
$spec.DeviceChange[0].Device.Key = 13000
$spec.DeviceChange[0].Operation = $action
$spec.CpuFeatureMask = New-Object VMware.Vim.VirtualMachineCpuIdInfoSpec[] (0)
$_thisvm = get-vm -Server $myvcenter -name $gridvm | ForEach-Object { (get-view $_.Id).moref }
$_this = Get-View -Id $_thisvm
$_this.ReconfigVM_Task($spec)

# Start the local VM after adding or removing the GRID card
# 
Start-VM -VM $gridvm -Confirm:$false
Start-Sleep -s 2