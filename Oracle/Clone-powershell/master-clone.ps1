#region sdt
# Set SDT in LM so that On-call doesn't get alerted
# 
<# Use TLS 1.2 #>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

<# account info #>
$accessId = 'D889JMm2Xrbv5N3f4W2k'
$accessKey = 'Ma9e3f6T_7-ErJa8^25CiXYvZL+An=}hmtdMtfzJ'
$company = 'powerdesigninc'

<# Varibles for setting SDT per device and time frame#>
$sdtDuration = '3600000' <# time in milliseconds for the duration of SDT, 3600000 is 1H, 7200000 is 2H etc etc#>
$esx23id = '351'
$esx25id = '297'
$vcsa02id = '1173'
$vcsa04id = '1473'

<# Get current time in milliseconds #>
$epoch = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)
$epochSDTstart = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)
$epochSDTEnd = $epochSDTStart + $sdtDuration

<# request details #>
$httpVerb = 'POST'
$resourcePath = '/sdt/sdts'
$data = "{`"sdtType`":1,`"type`":`"DeviceSDT`",`"deviceId`":$esx23id,`"startDateTime`":$epochSDTstart,`"endDateTime`":$epochSDTend}"

<# Construct URL #>
$url = 'https://' + $company + '.logicmonitor.com/santaba/rest' + $resourcePath

<# Concatenate Request Details #>
$requestVars = $httpVerb + $epoch + $data + $resourcePath

<# Construct Signature #>
$hmac = New-Object System.Security.Cryptography.HMACSHA256
$hmac.Key = [Text.Encoding]::UTF8.GetBytes($accessKey)
$signatureBytes = $hmac.ComputeHash([Text.Encoding]::UTF8.GetBytes($requestVars))
$signatureHex = [System.BitConverter]::ToString($signatureBytes) -replace '-'
$signature = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($signatureHex.ToLower()))

<# Construct Headers #>
$auth = 'LMv1 ' + $accessId + ':' + $signature + ':' + $epoch
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $auth)
$headers.Add("Content-Type", 'application/json')

<# Make Request #>
$response = Invoke-RestMethod -Uri $url -Method $httpVerb -Body $data -Header $headers

<# Print status and body of response1 #>
$status = $response.status
$body = $response.data | ConvertTo-Json -Depth 5

Write-Host "Status:$status"
Write-Host "Response:$body"

<# Get current time in milliseconds #>
$epoch = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)
$epochSDTstart = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)
$epochSDTEnd = $epochSDTStart + $sdtDuration

<# request details #>
$httpVerb = 'POST'
$resourcePath = '/sdt/sdts'
$data = "{`"sdtType`":1,`"type`":`"DeviceSDT`",`"deviceId`":$esx25id,`"startDateTime`":$epochSDTstart,`"endDateTime`":$epochSDTend}"

<# Construct URL #>
$url = 'https://' + $company + '.logicmonitor.com/santaba/rest' + $resourcePath

<# Concatenate Request Details #>
$requestVars = $httpVerb + $epoch + $data + $resourcePath

<# Construct Signature #>
$hmac = New-Object System.Security.Cryptography.HMACSHA256
$hmac.Key = [Text.Encoding]::UTF8.GetBytes($accessKey)
$signatureBytes = $hmac.ComputeHash([Text.Encoding]::UTF8.GetBytes($requestVars))
$signatureHex = [System.BitConverter]::ToString($signatureBytes) -replace '-'
$signature = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($signatureHex.ToLower()))

<# Construct Headers #>
$auth = 'LMv1 ' + $accessId + ':' + $signature + ':' + $epoch
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $auth)
$headers.Add("Content-Type", 'application/json')

<# Make Request #>
$response = Invoke-RestMethod -Uri $url -Method $httpVerb -Body $data -Header $headers

<# Print status and body of response1 #>
$status = $response.status
$body = $response.data | ConvertTo-Json -Depth 5

Write-Host "Status:$status"
Write-Host "Response:$body"

<# Get current time in milliseconds #>
$epoch = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)
$epochSDTstart = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)
$epochSDTEnd = $epochSDTStart + $sdtDuration

<# request details #>
$httpVerb = 'POST'
$resourcePath = '/sdt/sdts'
$data = "{`"sdtType`":1,`"type`":`"DeviceSDT`",`"deviceId`":$vcsa02id,`"startDateTime`":$epochSDTstart,`"endDateTime`":$epochSDTend}"

<# Construct URL #>
$url = 'https://' + $company + '.logicmonitor.com/santaba/rest' + $resourcePath

<# Concatenate Request Details #>
$requestVars = $httpVerb + $epoch + $data + $resourcePath

<# Construct Signature #>
$hmac = New-Object System.Security.Cryptography.HMACSHA256
$hmac.Key = [Text.Encoding]::UTF8.GetBytes($accessKey)
$signatureBytes = $hmac.ComputeHash([Text.Encoding]::UTF8.GetBytes($requestVars))
$signatureHex = [System.BitConverter]::ToString($signatureBytes) -replace '-'
$signature = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($signatureHex.ToLower()))

<# Construct Headers #>
$auth = 'LMv1 ' + $accessId + ':' + $signature + ':' + $epoch
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $auth)
$headers.Add("Content-Type", 'application/json')

<# Make Request #>
$response = Invoke-RestMethod -Uri $url -Method $httpVerb -Body $data -Header $headers

<# Print status and body of response1 #>
$status = $response.status
$body = $response.data | ConvertTo-Json -Depth 5

Write-Host "Status:$status"
Write-Host "Response:$body"


<# Get current time in milliseconds #>
$epoch = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)
$epochSDTstart = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)
$epochSDTEnd = $epochSDTStart + $sdtDuration

<# request details #>
$httpVerb = 'POST'
$resourcePath = '/sdt/sdts'
$data = "{`"sdtType`":1,`"type`":`"DeviceSDT`",`"deviceId`":$vcsa04id,`"startDateTime`":$epochSDTstart,`"endDateTime`":$epochSDTend}"

<# Construct URL #>
$url = 'https://' + $company + '.logicmonitor.com/santaba/rest' + $resourcePath

<# Concatenate Request Details #>
$requestVars = $httpVerb + $epoch + $data + $resourcePath

<# Construct Signature #>
$hmac = New-Object System.Security.Cryptography.HMACSHA256
$hmac.Key = [Text.Encoding]::UTF8.GetBytes($accessKey)
$signatureBytes = $hmac.ComputeHash([Text.Encoding]::UTF8.GetBytes($requestVars))
$signatureHex = [System.BitConverter]::ToString($signatureBytes) -replace '-'
$signature = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($signatureHex.ToLower()))

<# Construct Headers #>
$auth = 'LMv1 ' + $accessId + ':' + $signature + ':' + $epoch
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $auth)
$headers.Add("Content-Type", 'application/json')

<# Make Request #>
$response = Invoke-RestMethod -Uri $url -Method $httpVerb -Body $data -Header $headers

<# Print status and body of response1 #>
$status = $response.status
$body = $response.data | ConvertTo-Json -Depth 5

Write-Host "Status:$status"
Write-Host "Response:$body"

#endregion sdt
#region input
# Read in the users choice for the oracle clone instance value
# 
param (
    [string]$labn = $(Read-Host "Oracle Lab Instance Value (01,02,03,04,05)" )
    )
#endregion input
#region variables

# Current as of PowerCLI 12 for Powershell 7 core
# Declare the variables to use in the script
# 
$user = 'service@vsphere.local'
$pass = 'a47Wz3axkAB6*38Pnvym'
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

# Client config parameters for cloned APP VM
# 
$vcpuAPP = '2'
$ramAPP = '8'

# Client config parameters for cloned APP VM
# 
$vcpuDB = '2'
$ramDB = '28'
#endregion variables

#region connections
# Connect to the vCenter that you want to work with
# 
Write-Host "Connecting to the VCSA appliances we need to use" -ForegroundColor Red
Connect-VIServer -Server $vcsa02 -Protocol https -User $user -Password $pass
Connect-VIServer -Server $vcsa04 -Protocol https -User $user -Password $pass
Start-Sleep -s 2

# $vms = get-vm -Name *
# 
$esxcli25 = Get-EsxCli -VMhost pdi-esx25.powerdesigninc.us -V2
$esxcli23 = Get-EsxCli -VMhost pdi-esx23.powerdesigninc.us -V2
#endregion connections

#region getdata
# Get the Hosts in the vCenter so that we can use them later
# 
Write-Host "Get vSphere hosts in the cluster" -ForegroundColor Red
$vsphereHosts = Get-VMHost | ForEach-Object { (Get-View $_.Id).name }
$morefHosts = Get-VMHost | ForEach-Object { (Get-View $_.Id).moref.value }
Start-Sleep -s 1

# Get the app & DB UUID of the VM (useful for running some other commands if it is stored as a variable)
# 
Write-Host "Get the App & DB UUID vm" -ForegroundColor Red
$appVMuuid = Get-VM -Server $vcsa02 -name ("*APP" + $labn) | ForEach-Object { (Get-View $_.Id).config.uuid }
$dbVMuuid = Get-Vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).config.uuid }  
Start-Sleep -s 1

# Get the name of the VM in full (useful for running some other commands if it is stored as a variable)
# 
$vmAPPname = Get-VM -Server $vcsa02 -name ("*APP" + $labn) | ForEach-Object { (Get-View $_.Id).name } 
$vmDBname = Get-Vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).name }
Start-Sleep -s 1

# Get the app & DB vm config number (useful for running some other commands if it is stored as a variable)
# 
$vmappid = get-vm -Server $vcsa02 -name ("*APP" + $labn) | ForEach-Object { (Get-View $_.Id).moref.value }
$vmdbid = get-vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).moref.value }
Start-Sleep -s 1

# Get the datastores for the app and DB tier as a datastore value
# 
$vmappds = get-vm -Server $vcsa02 -name ("*APP" + $labn) | ForEach-Object { (Get-View $_.Id).datastore.value }
$vmdbds = get-vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).datastore.value }
Start-Sleep -s 1

#endregion getdata

#region vsphereactions

# Stops the local VM from Running
# 
Write-Host "Stop the local VMs" -ForegroundColor Red
Stop-VM -VM $vmAPPname -Confirm:$false
Stop-VM -VM $vmDBname -Confirm:$false
Start-Sleep -s 1

# Removes the VM from inventory
# 
Write-Host "Remove the VMs from inventory" -ForegroundColor Red
Remove-VM -VM $vmAPPname -Confirm:$false
Remove-VM -VM $vmDBname -Confirm:$false
Start-Sleep -s 1

# Removes the datastores from inventory
# 
Write-Host "Remove the datastores from the vSphere hosts" -ForegroundColor Red
Remove-Datastore -Datastore ('LABAPP'+$labn) -VMHost 'pdi-esx25.powerdesigninc.us' -Confirm:$false
Remove-Datastore -Datastore ('LAB' + $labn + 'DB1'), ('LAB' + $labn + 'DB2'), ('LAB' + $labn + 'DB3'), ('LAB' + $labn + 'DB4'), ('LAB' + $labn + 'DB5'), ('LAB' + $labn + 'DB6'), ('LAB' + $labn + 'DB7') -VMHost 'pdi-esx23.powerdesigninc.us' -Confirm:$false
Start-Sleep -s 1

#endregion vsphereactions

#region nimble

Clear-Host
Write-Host "About to do things with Nimble" -ForegroundColor Red

# 
# Break to run Nimble delete / and clone
# 

# Create the variables
# 
$labapp = "LABORAAPP" + $labn
$labdb1 = "LABORADB" + $labn + "1"
$labdb2 = "LABORADB" + $labn + "2"
$labdb3 = "LABORADB" + $labn + "3"
$labdb4 = "LABORADB" + $labn + "4"
$labdb5 = "LABORADB" + $labn + "5"
$labdb6 = "LABORADB" + $labn + "6"
$labdb7 = "LABORADB" + $labn + "7"
$snapapp = ""
$snapdb = ""

# Define clear text string for username and password
[string]$userName = 'tmadmin'
[string]$userPassword = 'Y@p49RBd4z7CMGDSg%qxKj'

# Convert to SecureString
[securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
[pscredential]$credObject = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)

# Login to the Nimble Volume
# 
Write-Host "Connecting to the Nimble array" -ForegroundColor Green
Connect-NSGroup -group 172.27.1.200 -credential $credObject

# A little output to let the user know what is going on
# 
Write-Host "Removing Nimble volumes for Oracle LAB$labn" -ForegroundColor Red

# Disconnect, disassociate, and remove the Nimble volumes associated with the LAB instance 
#
Write-Host "Removing Nimble volumes for Oracle $labapp" -ForegroundColor Green
$response = Get-NSVolume -name $labapp | select-object id
$responseid = $response.id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

Write-Host "Removing Nimble volumes for Oracle $labdb1" -ForegroundColor Green
$response = Get-NSVolume -name $labdb1 | select-object id
$responseid = $response.id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

Write-Host "Removing Nimble volumes for Oracle $labdb2" -ForegroundColor Green
$response = Get-NSVolume -name $labdb2 | select-object id
$responseid = $response.id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

Write-Host "Removing Nimble volumes for Oracle $labdb3" -ForegroundColor Green
$response = Get-NSVolume -name $labdb3 | select-object id
$responseid = $response.id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

Write-Host "Removing Nimble volumes for Oracle $labdb4" -ForegroundColor Green
$response = Get-NSVolume -name $labdb4 | select-object id
$responseid = $response.id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

Write-Host "Removing Nimble volumes for Oracle $labdb5" -ForegroundColor Green
$response = Get-NSVolume -name $labdb5 | select-object id
$responseid = $response.id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

Write-Host "Removing Nimble volumes for Oracle $labdb6" -ForegroundColor Green
$response = Get-NSVolume -name $labdb6 | select-object id
$responseid = $response.id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

Write-Host "Removing Nimble volumes for Oracle $labdb7" -ForegroundColor Green
$response = Get-NSVolume -name $labdb7 | select-object id
$responseid = $response.id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

Write-Host "Finished with removing and deleting the Volumes - Break out if you do NOT want to create new volumes" -ForegroundColor Red -BackgroundColor Yellow
pause
Clear-Host

# Start the clone process
# Discover the last snap ID to be taken on the Oracle App volume
#
$lastsnap = get-NSvolume -name PDIVLORACLAPP | select-object last_snap
$lastsnaptimeidapp = $lastsnap.last_snap.snap_id

$lastsnap = get-NSvolume -name PDIVLORACLDB1 | select-object last_snap
$lastsnaptimeiddb1 = $lastsnap.last_snap.snap_id

$lastsnap = get-NSvolume -name PDIVLORACLDB5 | select-object last_snap
$lastsnaptimeiddb2 = $lastsnap.last_snap.snap_id

$lastsnap = get-NSvolume -name PDIVLORACLDB7 | select-object last_snap
$lastsnaptimeiddb3 = $lastsnap.last_snap.snap_id

$lastsnap = get-NSvolume -name PDIVLORACLDB12 | select-object last_snap
$lastsnaptimeiddb4 = $lastsnap.last_snap.snap_id

$lastsnap = get-NSvolume -name PDIVLORACLDB13 | select-object last_snap
$lastsnaptimeiddb5 = $lastsnap.last_snap.snap_id

$lastsnap = get-NSvolume -name PDIVLORACLDB14 | select-object last_snap
$lastsnaptimeiddb6 = $lastsnap.last_snap.snap_id

$lastsnap = get-NSvolume -name PDIVLORACLDB15 | select-object last_snap
$lastsnaptimeiddb7 = $lastsnap.last_snap.snap_id

# Create the snap volumes with lab names
#
Write-Host "Cloning the oracle volumes for LAB$labn" -ForegroundColor Red
$action = New-NSvolume -name $labapp -clone $true -base_snap_id $lastsnaptimeidapp -inherit_acl $true
$action = New-NSvolume -name $labdb1 -clone $true -base_snap_id $lastsnaptimeiddb1 -inherit_acl $false
$action = New-NSvolume -name $labdb2 -clone $true -base_snap_id $lastsnaptimeiddb2 -inherit_acl $false
$action = New-NSvolume -name $labdb3 -clone $true -base_snap_id $lastsnaptimeiddb3 -inherit_acl $false
$action = New-NSvolume -name $labdb4 -clone $true -base_snap_id $lastsnaptimeiddb4 -inherit_acl $false
$action = New-NSvolume -name $labdb5 -clone $true -base_snap_id $lastsnaptimeiddb5 -inherit_acl $false
$action = New-NSvolume -name $labdb6 -clone $true -base_snap_id $lastsnaptimeiddb6 -inherit_acl $false
$action = New-NSvolume -name $labdb7 -clone $true -base_snap_id $lastsnaptimeiddb7 -inherit_acl $false

# Get the new Nimble Volume ID's for the clones we just created
# 
$db1vol = get-NSvolume -name $labdb1 | select-object Id
$db1volid = $db1vol.id

$db2vol = get-NSvolume -name $labdb2 | select-object Id
$db2volid = $db2vol.id

$db3vol = get-NSvolume -name $labdb3 | select-object Id
$db3volid = $db3vol.id

$db4vol = get-NSvolume -name $labdb4 | select-object Id
$db4volid = $db4vol.id

$db5vol = get-NSvolume -name $labdb5 | select-object Id
$db5volid = $db5vol.id

$db6vol = get-NSvolume -name $labdb6 | select-object Id
$db6volid = $db6vol.id

$db7vol = get-NSvolume -name $labdb7 | select-object Id
$db7volid = $db7vol.id

# Add initiator group access to the new Clones because we have the lab env on a different host (ESX23)
# 
Write-Host "Adding iSCSI init groups to the new DB vols" -ForegroundColor Red
Write-Host "Adding PDI-ESX23 initiator to $labdb1" -ForegroundColor Green
New-NSAccessControlRecord -initiator_group_id 025b62a468b66e547c00000000000000000000000d -vol_id $db1volid
Write-Host "Adding PDI-ESX23 initiator to $labdb2" -ForegroundColor Green
New-NSAccessControlRecord -initiator_group_id 025b62a468b66e547c00000000000000000000000d -vol_id $db2volid
Write-Host "Adding PDI-ESX23 initiator to $labdb3" -ForegroundColor Green
New-NSAccessControlRecord -initiator_group_id 025b62a468b66e547c00000000000000000000000d -vol_id $db3volid
Write-Host "Adding PDI-ESX23 initiator to $labdb4" -ForegroundColor Green
New-NSAccessControlRecord -initiator_group_id 025b62a468b66e547c00000000000000000000000d -vol_id $db4volid
Write-Host "Adding PDI-ESX23 initiator to $labdb5" -ForegroundColor Green
New-NSAccessControlRecord -initiator_group_id 025b62a468b66e547c00000000000000000000000d -vol_id $db5volid
Write-Host "Adding PDI-ESX23 initiator to $labdb6" -ForegroundColor Green
New-NSAccessControlRecord -initiator_group_id 025b62a468b66e547c00000000000000000000000d -vol_id $db6volid
Write-Host "Adding PDI-ESX23 initiator to $labdb7" -ForegroundColor Green
New-NSAccessControlRecord -initiator_group_id 025b62a468b66e547c00000000000000000000000d -vol_id $db7volid

# Disconnect from the Nimble array because we are done.
# 
Disconnect-NSGroup
Write-Host "Disconnected from the Nimble array" -ForegroundColor Green

#endregion nimble

#region vsphere2

# Refresh the iSCSI adapter, rescan it for new VMFS volumes, rescanning all HBAs
# 
Write-Host "Rescan vSphere HBAs" -ForegroundColor Red
Get-VmHostStorage -VMHost $vsphere23 -Refresh -RescanVmfs -RescanAllHba
Get-VmHostStorage -VMHost $vsphere25 -Refresh -RescanVmfs -RescanAllHba
Start-Sleep -s 10

# Resignature the newly cloned VMFS volumes
# 
Write-Host "Resignature the cloned datastores" -ForegroundColor Red
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
Write-Host "Rename the cloned datastores to make it clear for LAB$labn" -ForegroundColor Red
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
Write-Host "Move the datastores into folders for easy seperation and clarity for monitoring environments" -ForegroundColor Red
Get-Datastore ('LAB' + $labn + 'DB1'), ('LAB' + $labn + 'DB2'), ('LAB' + $labn + 'DB3'), ('LAB' + $labn + 'DB4'), ('LAB' + $labn + 'DB5'), ('LAB' + $labn + 'DB6'), ('LAB' + $labn + 'DB7'),('LABAPP' + $labn) | Move-datastore -Destination ('LAB'+$labn)
Start-Sleep -s 2

# Register the VMX files with the appropriate hosts
# 
Write-Host "Register the LAB$labn APP vm" -ForegroundColor Red
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
Start-Sleep -s 1

# Power the VM on and Answer the question of copying it
#
Write-Host "Start the APP Vm" -ForegroundColor Red
Start-VM $newAPPname
Start-Sleep -s 2
Get-VM $newAPPname | Get-VMQuestion | Set-VMQuestion -DefaultOption  -Confirm:$false

# Add the DB to inventory and start it
# 
Write-Host "Register the LAB$labn DB vm" -ForegroundColor Red
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
Start-Sleep -s 1

 Write-Host "Reconfigure the DB vDisks for linkage to the clone" -ForegroundColor Red

# Reconfigure the DB vmx file because we added new disks
# 

#region vspherevdisk

# Global variables
#
$user = 'service@vsphere.local'
$pass = 'a47Wz3axkAB6*38Pnvym'
$vcsa02 = 'pdivcsa-02.powerdesigninc.us'
$vcsa04 = 'pdivcsa-04.powerdesigninc.us'

# login to the vCenter
# 
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Basic c2VydmljZUB2c3BoZXJlLmxvY2FsOmE0N1d6M2F4a0FCNiozOFBudnlt")
$headers.Add("Cookie", "vmware-api-session-id=222cee7c16b6135d0a017b217fd4fac8")

$response = Invoke-RestMethod 'https://172.27.1.157/rest/com/vmware/cis/session' -SkipCertificateCheck -Method 'POST' -Headers $headers -UseBasicParsing
$response | ConvertTo-Json 
$sessionid = $response.value

# Get the DB VM vmware Id
# 
Connect-VIServer -Server $vcsa02 -Protocol https -User $user -Password $pass
Connect-VIServer -Server $vcsa04 -Protocol https -User $user -Password $pass
$vmdbid = get-vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).moref.value }

# Create the LAB flavored DB datastore variables 
# 
$dbds2 = 'LAB' + $labn + 'DB2'
$dbds3 = 'LAB' + $labn + 'DB3'
$dbds4 = 'LAB' + $labn + 'DB4'
$dbds5 = 'LAB' + $labn + 'DB5'
$dbds6 = 'LAB' + $labn + 'DB6'
$dbds7 = 'LAB' + $labn + 'DB7'

# Disk 2 replacement
# 
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=$sessionid")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[$dbds2] PDIVLORACLDB/PDIVLORACLDB_9.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}
`n
`n"

$response = Invoke-RestMethod "https://172.27.1.157/rest/vcenter/vm/$vmdbid/hardware/disk/2001" -SkipCertificateCheck -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

# Disk 3 replacement
# 
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=$sessionid")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[$dbds3] PDIVLORACLDB/PDIVLORACLDB_11.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}
`n
`n"

$response = Invoke-RestMethod "https://172.27.1.157/rest/vcenter/vm/$vmdbid/hardware/disk/2002" -SkipCertificateCheck -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

# Disk 4 replacement
# 
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=$sessionid")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[$dbds4] PDIVLORACLDB/PDIVLORACLDB_4.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}
`n"

$response = Invoke-RestMethod "https://172.27.1.157/rest/vcenter/vm/$vmdbid/hardware/disk/2003" -SkipCertificateCheck -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

# Disk 5 replacement
# 
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=$sessionid")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[$dbds5] PDIVLORACLDB/PDIVLORACLDB_7.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}
`n"

$response = Invoke-RestMethod "https://172.27.1.157/rest/vcenter/vm/$vmdbid/hardware/disk/2004" -SkipCertificateCheck -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

# Disk 6 replacement
# 
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=$sessionid")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[$dbds6] PDIVLORACLDB/PDIVLORACLDB_8.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}"

$response = Invoke-RestMethod "https://172.27.1.157/rest/vcenter/vm/$vmdbid/hardware/disk/2006" -SkipCertificateCheck -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

# Disk 7 replacement
# 
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=$sessionid")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[$dbds7] PDIVLORACLDB/PDIVLORACLDB.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}"

$response = Invoke-RestMethod "https://172.27.1.157/rest/vcenter/vm/$vmdbid/hardware/disk/2005" -SkipCertificateCheck -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

#endregion vspherevdisk


# Power the VM on and Answer the question of copying it
# 
Write-Host "Start the DB Vm" -ForegroundColor Red
Start-VM $newDBname
Start-Sleep -s 2
Get-VM $newDBname | Get-VMQuestion | Set-VMQuestion -DefaultOption  -Confirm:$false

# Do the oracle refresh in the actual OS
#
Write-Host "Do the Oracle refresh at the CLI" -ForegroundColor Red 

pause 

# Reconfigure the VM, RAM & connect the NIC after the refresh is done
# 
Write-Host "Reconfigure the VM memory and add the network adapter for connecting at start" -ForegroundColor Red
Get-VM -Name $newDBname | Set-VM -MemoryGB $ramDB -Confirm:$false
Get-VM -Name $newDBname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected:$true -Confirm:$false
Get-VM -Name $newAPPname | Get-NetworkAdapter | Set-NetworkAdapter -StartConnected:$true -Confirm:$false
pause
Write-Host "Power on the VM for the final time" -ForegroundColor Red
Start-VM $newAPPname
Start-VM $newDBname

Write-Host "We're done here - don't forget to remove your SDT" -ForegroundColor Green
#endregion vsphere2