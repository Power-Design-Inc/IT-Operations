$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Basic YWRtaW5pc3RyYXRvckB2c3BoZXJlLmxvY2FsOm0wRyFReDYxNUdYJnledkhtdFpz")
$headers.Add("Cookie", "vmware-api-session-id=04db3e64c6650449c0130399d3a3bcc5")

$response = Invoke-RestMethod 'https://172.27.1.157/rest/com/vmware/cis/session' -skipcertificatecheck -Method 'POST' -Headers $headers
$response | ConvertTo-Json