# 
# Choose your lab instance
param (
    [string]$labn = $(Read-Host "Oracle Lab Instance Value (01,02,03,04,05)" )
)

# 
# Global variables
$user = 'service@vsphere.local'
$pass = 'a47Wz3axkAB6*38Pnvym'
$vcsa02 = 'pdivcsa-02.powerdesigninc.us'
$vcsa04 = 'pdivcsa-04.powerdesigninc.us'

# 
# login to the vCenter
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Basic c2VydmljZUB2c3BoZXJlLmxvY2FsOmE0N1d6M2F4a0FCNiozOFBudnlt")
$headers.Add("Cookie", "vmware-api-session-id=222cee7c16b6135d0a017b217fd4fac8")

$response = Invoke-RestMethod 'https://172.27.1.157/rest/com/vmware/cis/session' -SkipCertificateCheck -Method 'POST' -Headers $headers -UseBasicParsing
$response | ConvertTo-Json 
$sessionid = $response.value

# 
# Get the DB VM vmware ID
Connect-VIServer -Server $vcsa02 -Protocol https -User $user -Password $pass
Connect-VIServer -Server $vcsa04 -Protocol https -User $user -Password $pass
$vmdbid = get-vm -Server $vcsa04 -name ("*DB" + $labn) | ForEach-Object { (Get-View $_.Id).moref.value }

# 
# Create the LAB flavored DB datastore variables 
$dbds2 = 'LAB' + $labn + 'DB2'
$dbds3 = 'LAB' + $labn + 'DB3'
$dbds4 = 'LAB' + $labn + 'DB4'
$dbds5 = 'LAB' + $labn + 'DB5'
$dbds6 = 'LAB' + $labn + 'DB6'
$dbds7 = 'LAB' + $labn + 'DB7'

# 
# Disk 2 replacement
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

# 
# Disk 3 replacement
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

# 
# Disk 4 replacement
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

# 
# Disk 5 replacement
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

# 
# Disk 6 replacement
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

# 
# Disk 7 replacement
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

#
# Exit the PS Process
Exit-PSHostProcess