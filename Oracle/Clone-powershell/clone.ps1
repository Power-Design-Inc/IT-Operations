# 
# Read in the users choice for the oracle clone instance value
# 
param (
    [string]$labn = $(Read-Host "Oracle Lab Instance Value (01,02,03,04,05)" )
    )

#
# Current as of PowerCLI 12 for Powershell 7 core
# Declare the variables to use in the script
# 
$user = 'administrator@vsphere.local'
$pass = 'm0G!Qx615GX&y^vHmtZs'
$vcsa02 = 'pdivcsa-02.powerdesigninc.us'
$vcsa04 = 'pdivcsa-04.powerdesigninc.us'
$vsphere23 = 'pdi-esx23.powerdesigninc.us'
$vsphere25 = 'pdi-esx25.powerdesigninc.us'
$vmAPPid = ''
$vmDBid = ''
$vmAPPname = ''
$vmDBname = ''
$vmAPPds = ''
$vmDBds = ''
$vsphereHosts = ''
$morefHosts = ''
$resigAPP = @{ volumeuuid = '5ed144c4-d5ebd3b8-cfd6-f403433d8648'}
$resigDB1 = @{ volumeuuid = '5ed14521-f883a490-1615-f403433ed358'}
$resigDB5 = @{ volumeuuid = '5ed144e3-92693890-f6a6-f403433ed358'}
$resigDB7 = @{ volumeuuid = '5ed144f8-024608b4-c2cd-f403433ed358'}
$resigDB12 = @{ volumeuuid = '5ed1450a-e6f7d526-7d5d-f403433ed358'}
$resigDB13 = @{ volumeuuid = '5e380fd9-0bc603fa-fc40-f403433ed358'}
$resigDB14 = @{ volumeuuid = '5ed14516-05304262-01b6-f403433ed358'}
$resigDB15 = @{ volumeuuid = '60039edf-a64cc160-c981-f403433ed358'}

# Nimble powershell variables for version 3.2.0 for Powershell 7 core
# 
$nimble = "172.27.1.200"
$nimbleUser = "tmadmin"

# Client config parameters for cloned APP VM
# 
$vcpuAPP = '2'
$ramAPP = '8'

# Client config parameters for cloned APP VM
# 
$vcpuDB = '2'
$ramDB = '28'

# Connect to the vCenter that you want to work with
# 
Connect-VIServer -Server $vcsa02 -Protocol https -User $user -Password $pass
Connect-VIServer -Server $vcsa04 -Protocol https -User $user -Password $pass
Start-Sleep -s 5

# $vms = get-vm -Name *
$esxcli25 = Get-EsxCli -VMhost pdi-esx25.powerdesigninc.us -V2
$esxcli23 = Get-EsxCli -VMhost pdi-esx23.powerdesigninc.us -V2

# Get the Hosts in the vCenter so that we can use them later
# 
$vsphereHosts = Get-VMHost | ForEach-Object { (Get-View $_.Id).name }
$morefHosts = Get-VMHost | ForEach-Object { (Get-View $_.Id).moref.value }
Start-Sleep -s 1
$vsphereHosts
$morefHosts

# Get the app & DB UUID of the VM (useful for running some other commands if it is stored as a variable)
# 
$appVMuuid = Get-VM -Server $vcsa02 -name ("*APP" + $labn) | ForEach-Object { (Get-View $_.Id).config.uuid }
$dbVMuuid = Get-Vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).config.uuid }  
Start-Sleep -s 1
$appVMuuid
$dbVMuuid

# Get the name of the VM in full (useful for running some other commands if it is stored as a variable)
# 
$vmAPPname = Get-VM -Server $vcsa02 -name ("*APP" + $labn) | ForEach-Object { (Get-View $_.Id).name } 
$vmDBname = Get-Vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).name }
Start-Sleep -s 1
$vmAPPname
$vmDBname

# Get the app & DB vm config number (useful for running some other commands if it is stored as a variable)
# 
$vmappid = get-vm -Server $vcsa02 -name ("*APP" + $labn) | ForEach-Object { (Get-View $_.Id).moref.value }
$vmdbid = get-vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).moref.value }
Start-Sleep -s 1
$vmappid
$vmdbid

# Get the datastores for the app and DB tier as a datastore value
# 
$vmappds = get-vm -Server $vcsa02 -name ("*APP" + $labn) | ForEach-Object { (Get-View $_.Id).datastore.value }
$vmdbds = get-vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).datastore.value }
Start-Sleep -s 1
$vmappds
$vmdbds

# Stops the local VM from Running
# 
Stop-VM -VM $vmAPPname -Confirm:$false
Stop-VM -VM $vmDBname -Confirm:$false
Start-Sleep -s 1

# Removes the VM from inventory
# 
Remove-VM -VM $vmAPPname -Confirm:$false
Remove-VM -VM $vmDBname -Confirm:$false
Start-Sleep -s 1

# Removes the datastores from inventory
# 
Remove-Datastore -Datastore ('LABAPP'+$labn) -VMHost 'pdi-esx25.powerdesigninc.us' -Confirm:$false
Remove-Datastore -Datastore ('LAB' + $labn + 'DB1'), ('LAB' + $labn + 'DB2'), ('LAB' + $labn + 'DB3'), ('LAB' + $labn + 'DB4'), ('LAB' + $labn + 'DB5'), ('LAB' + $labn + 'DB6'), ('LAB' + $labn + 'DB7') -VMHost 'pdi-esx23.powerdesigninc.us' -Confirm:$false
Start-Sleep -s 1

pause 

# Break to run Nimble delete / and clone
# 
#Connect-NSGroup -group $nimble -Credential $nimbleUser -ImportServerCertificate

# Refresh the iSCSI adapter, rescan it for new VMFS volumes, rescanning all HBAs
# 
#Get-VmHostStorage -VMHost $vsphereHosts -Refresh -RescanVmfs -RescanAllHba
Get-VmHostStorage -VMHost $vsphere23 -Refresh -RescanVmfs -RescanAllHba
Get-VmHostStorage -VMHost $vsphere25 -Refresh -RescanVmfs -RescanAllHba
Start-Sleep -s 10

# Resignature the newly cloned VMFS volumes
# 
$esxcli25.storage.vmfs.snapshot.resignature.Invoke($resigAPP)
$esxcli23.storage.vmfs.snapshot.resignature.Invoke($resigDB1)
$esxcli23.storage.vmfs.snapshot.resignature.Invoke($resigDB5)
$esxcli23.storage.vmfs.snapshot.resignature.Invoke($resigDB7)
$esxcli23.storage.vmfs.snapshot.resignature.Invoke($resigDB12)
$esxcli23.storage.vmfs.snapshot.resignature.Invoke($resigDB13)
$esxcli23.storage.vmfs.snapshot.resignature.Invoke($resigDB14)
$esxcli23.storage.vmfs.snapshot.resignature.Invoke($resigDB15)
Start-Sleep -s 10

# Rename the datastore to the appropriate lab number
# 
get-datastore | where-object {($_.Name -like 'snap*db1')} | Set-Datastore -Name ('LAB'+$labn+'DB1')
get-datastore | where-object {($_.Name -like 'snap*db5')} | Set-Datastore -Name ('LAB'+$labn+'DB2')
get-datastore | where-object {($_.Name -like 'snap*db7')} | Set-Datastore -Name ('LAB'+$labn+'DB3')
get-datastore | where-object {($_.Name -like 'snap*db12')} | Set-Datastore -Name ('LAB'+$labn+'DB4')
get-datastore | where-object {($_.Name -like 'snap*db13')} | Set-Datastore -Name ('LAB'+$labn+'DB5')
get-datastore | where-object {($_.Name -like 'snap*db14')} | Set-Datastore -Name ('LAB'+$labn+'DB6')
get-datastore | where-object {($_.Name -like 'snap*db15')} | Set-Datastore -Name ('LAB'+$labn+'DB7')
get-datastore | where-object {($_.Name -like 'snap*app')} | Set-Datastore -Name ('LABAPP'+$labn)
Start-Sleep -s 5

# Move the datastores to the appropriate storage lab folder
# 
Get-Datastore ('LAB' + $labn + 'DB1'), ('LAB' + $labn + 'DB2'), ('LAB' + $labn + 'DB3'), ('LAB' + $labn + 'DB4'), ('LAB' + $labn + 'DB5'), ('LAB' + $labn + 'DB6'), ('LAB' + $labn + 'DB7'),('LABAPP' + $labn) | Move-datastore -Destination ('LAB'+$labn)
Start-Sleep -s 2

# Register the VMX files with the appropriate hosts
# 
$newAPPname = 'LABORAAPP'+$labn
$appVMXds = 'LABAPP'+$labn
$appVMXFile = "[$appVMXds] PDIVLORCLAPP/PDIVLORCLAPP.vmx"
$appVMFolder = Get-Folder 'LAB-APP'
New-VM -Name $newAPPname -VMFilePath $appVMXFile -VMHost $vsphere25 -Location $appVMFolder 
Get-VM -Name $newAPPname | Set-VM -NumCPU $vcpuAPP -MemoryGB $ramAPP -CoresPerSocket 1 -Confirm:$false
Get-VM -Name $newAPPname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected:$false -Confirm:$false
$appMoref = get-vm -Server $vcsa02 -name ("*APP" + $labn) | ForEach-Object { (Get-View $_.Id).moref }
$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.CpuAllocation = New-Object VMware.Vim.ResourceAllocationInfo
$spec.CpuAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.CpuAllocation.Shares.Shares = 2000
$spec.CpuAllocation.Shares.Level = 'normal'
$spec.MemoryAllocation = New-Object VMware.Vim.ResourceAllocationInfo
$spec.MemoryAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.MemoryAllocation.Shares.Shares = 1000000
$spec.MemoryAllocation.Shares.Level = 'normal'
$spec.MemoryAllocation.Reservation = 0
$_this = Get-View -Id $appMoref
$_this.ReconfigVM_Task($spec)
Start-Sleep -s 2

# Power the VM on and Answer the question of copying it
#
Start-VM $newAPPname
Start-Sleep -s 2
Get-VM $newAPPname | Get-VMQuestion | Set-VMQuestion -DefaultOption  -Confirm:$false

# Add the DB to inventory and start it
# 
$newDBname = 'LABORADB'+$labn
$dbVMXds = 'LAB'+$labn+'DB1'
$dbVMXFile = "[$dbVMXds] PDIVLORACLDB/PDIVLORACLDB.vmx"
$dbVMFolder = Get-Folder 'LAB-DB'
New-VM -Name $newDBname -VMFilePath $dbVMXFile -VMHost $vsphere23 -Location $dbVMFolder 
Get-VM -Name $newDBname | Set-VM -NumCPU $vcpuDB -CoresPerSocket 1 -Confirm:$false
Get-VM -Name $newDBname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected:$false -Confirm:$false
$dbMoref = get-vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).moref }
$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.CpuAllocation = New-Object VMware.Vim.ResourceAllocationInfo
$spec.CpuAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.CpuAllocation.Shares.Shares = 2000
$spec.CpuAllocation.Shares.Level = 'normal'
$spec.MemoryAllocation = New-Object VMware.Vim.ResourceAllocationInfo
$spec.MemoryAllocation.Shares = New-Object VMware.Vim.SharesInfo
$spec.MemoryAllocation.Shares.Shares = 1000000
$spec.MemoryAllocation.Shares.Level = 'normal'
$spec.MemoryAllocation.Reservation = 0
$_this = Get-View -Id $dbMoref
$_this.ReconfigVM_Task($spec)
Start-Sleep -s 2

pause 

# Power the VM on and Answer the question of copying it
# 
Start-VM $newDBname
Start-Sleep -s 2
Get-VM $newDBname | Get-VMQuestion | Set-VMQuestion -DefaultOption  -Confirm:$false

# Do the oracle refresh in the actual OS
# 

pause 

# Reconfigure the VM, RAM & connect the NIC after the refresh is done
# 
Get-VM -Name $newDBname | Set-VM -MemoryGB $ramDB -Confirm:$false
Get-VM -Name $newAPPname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected:$true -Confirm:$false
Get-VM -Name $newDBname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected:$true -Confirm:$false
Pause
Start-VM $newAPPname
Start-VM $newDBname