$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "vmware-api-session-id=5505a950b9c2620af8b39cf4b17185cf")

$response = Invoke-RestMethod 'https://172.27.1.101/rest/vcenter/vm?filter.names.1=LABORADB01' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=c6a782471ee7b6726052ecab24809ec8")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[LAB01DB2] PDIVLORACLDB/PDIVLORACLDB_9.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}
`n
`n"

$response = Invoke-RestMethod 'https://172.27.1.101/rest/vcenter/vm/vm-522/hardware/disk/2001' -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=c6a782471ee7b6726052ecab24809ec8")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[LAB01DB3] PDIVLORACLDB/PDIVLORACLDB_11.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}
`n
`n"

$response = Invoke-RestMethod 'https://172.27.1.101/rest/vcenter/vm/vm-522/hardware/disk/2002' -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=c6a782471ee7b6726052ecab24809ec8")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[LAB01DB4] PDIVLORACLDB/PDIVLORACLDB_4.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}
`n"

$response = Invoke-RestMethod 'https://172.27.1.101/rest/vcenter/vm/vm-522/hardware/disk/2003' -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=c6a782471ee7b6726052ecab24809ec8")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[LAB01DB5] PDIVLORACLDB/PDIVLORACLDB_7.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}
`n"

$response = Invoke-RestMethod 'https://172.27.1.101/rest/vcenter/vm/vm-522/hardware/disk/2004' -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=c6a782471ee7b6726052ecab24809ec8")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"[LAB01DB6] PDIVLORACLDB/PDIVLORACLDB_8.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}"

$response = Invoke-RestMethod 'https://172.27.1.101/rest/vcenter/vm/vm-522/hardware/disk/2006' -Method 'PATCH' -Headers $headers -Body $body
$response | ConvertTo-Json