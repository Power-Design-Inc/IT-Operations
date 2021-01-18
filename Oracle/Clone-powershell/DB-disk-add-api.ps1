$labn = '04'
$vmid = ''
$flabn = 'https://172.27.1.101/rest/vcenter/vm?filter.names.1=LABORADB' + $labn

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Basic YWRtaW5pc3RyYXRvckB2c3BoZXJlLmxvY2FsOm0wRyFReDYxNUdYJnledkhtdFpz")
$headers.Add("Cookie", "vmware-api-session-id=a1fc8203c85256091be56211d83f030b")
$body = $null
$response = Invoke-RestMethod 'https://172.27.1.101/rest/com/vmware/cis/session' -Method 'POST' -Headers $headers -Body $body -SkipCertificateCheck
$response | ConvertTo-Json



$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "vmware-api-session-id=4484e6d900d7762ae2c6fb3bb6dfff0d")
$response = Invoke-RestMethod $flabn -Method 'GET' -Headers $headers -Body $body -SkipCertificateCheck
$response | ConvertTo-Json












$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Cookie", "vmware-api-session-id=$session_response")

$body = "{
`n    `"spec`": {
`n        `"backing`": {
`n            `"vmdk_file`": `"['LAB' + $labn + 'DB2'] PDIVLORACLDB/PDIVLORACLDB_9.vmdk`",
`n            `"type`": `"VMDK_FILE`"
`n        }
`n    }
`n}
`n
`n"

$responseDB2 = Invoke-RestMethod 'https://172.27.1.101/rest/vcenter/vm/'+$vmid+'/hardware/disk/2001' -Method 'PATCH' -Headers $headers -Body $body
$responseDB2 | ConvertTo-Json