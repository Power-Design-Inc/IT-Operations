param (
    [string]$labn = $(Read-Host "Oracle Lab Instance Value (01,02,03,04,05)" )
)

# Login to the Nimble Volume
# 
Connect-NSGroup -group 172.27.1.200 -credential tmadmin

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

# Disconnect, disassociate, and remove the Nimble volumes associated with the LAB instance 
#  
$response = Get-NSVolume -name $labapp
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb1
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb2
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb3
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb4
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb5
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb6
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb7
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
#$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

# Start the clone process
# Discover the last snap ID to be taken on the Oracle App volume
#
$lastsnap = get-NSvolume -name PDIVLORACLAPP | select last_snap
$lastsnap | ConvertTo-Json
$lastsnaptimeid = $lastsnap.last_snap.snap_id
$lastsnaptimeid

# Create the snap volumes with lab names
#
$action = New-NSvolume -name $labapp -clone $true -base_snap_id $lastsnaptimeid
$action = New-NSvolume -name $labdb1 -clone $true -base_snap_id $lastsnaptimeid
$action = New-NSvolume -name $labdb2 -clone $true -base_snap_id $lastsnaptimeid
$action = New-NSvolume -name $labdb3 -clone $true -base_snap_id $lastsnaptimeid
$action = New-NSvolume -name $labdb4 -clone $true -base_snap_id $lastsnaptimeid
$action = New-NSvolume -name $labdb5 -clone $true -base_snap_id $lastsnaptimeid
$action = New-NSvolume -name $labdb6 -clone $true -base_snap_id $lastsnaptimeid
$action = New-NSvolume -name $labdb7 -clone $true -base_snap_id $lastsnaptimeid

##Getting initiator group and granting access
New-NSAccessControlRecord -initiator_group_id #################  -vol_id #########################



# Disconnect from the Nimble array because we are done.
# 
Disconnect-NSGroup


Cloning volumes requires clone, name and base_snap_id attributes where clone is set to true. Newly created volume will not
    have any access control records, they can be added to the volume by create operation on access_control_records object set. Cloned volume inherits access control records from the parent volume.