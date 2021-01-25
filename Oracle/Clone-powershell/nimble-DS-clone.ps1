#param (
#    [string]$labn = $(Read-Host "Oracle Lab Instance Value (1,2,3,4,5)" )
#)

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
$snapapp = 
$snapdb = 

# Disconnect, disassociate, and remove the Nimble volumes associated with the LAB instance 
#  
$response = Get-NSVolume -name $labapp
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb1
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb2
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb3
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb4
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb5
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb6
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

$response = Get-NSVolume -name $labdb7
$response | ConvertTo-Json
$responseid = $response.access_control_records.vol_id
$action = Set-NSVolume -id $responseid -online $false -force $true
$action = Remove-NSSnapshotCollection -id $responseid
$action = Remove-NSVolume -id $responseid

# Start the clone process
#
New-NSVolume -name $labapp -base_snap_id $snapapp -clone $true -online $true

##Getting initiator group and granting access
New-NSAccessControlRecord -initiator_group_id #################  -vol_id #########################



# Disconnect from the Nimble array because we are done.
# 
Disconnect-NSGroup


Cloning volumes requires clone, name and base_snap_id attributes where clone is set to true. Newly created volume will not
    have any access control records, they can be added to the volume by create operation on access_control_records object set. Cloned volume inherits access control records from the parent volume.