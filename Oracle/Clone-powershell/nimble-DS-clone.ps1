# Query the user for the lab instance that needs to be refreshed
# 
param (
    [string]$labn = $(Read-Host "Oracle Lab Instance Value (01,02,03,04,05)" )
)

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

Write-Host "Finished with removing and deleting the Volumes - Break out if you do NOT want to create new volumes" -ForegroundColor Red

pause 

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