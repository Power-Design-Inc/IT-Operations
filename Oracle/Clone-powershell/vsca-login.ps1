$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Basic c2VydmljZUB2c3BoZXJlLmxvY2FsOmE0N1d6M2F4a0FCNiozOFBudnlt")
$headers.Add("Cookie", "vmware-api-session-id=222cee7c16b6135d0a017b217fd4fac8")

$response = Invoke-RestMethod 'https://172.27.1.157/rest/com/vmware/cis/session' -SkipCertificateCheck -Method 'POST' -Headers $headers
$response | ConvertTo-Json