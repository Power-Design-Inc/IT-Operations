<# Use TLS 1.2 #>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

<# account info #>
$accessId = 'D889JMm2Xrbv5N3f4W2k'
$accessKey = 'Ma9e3f6T_7-ErJa8^25CiXYvZL+An=}hmtdMtfzJ'
$company = 'powerdesigninc'

<# request details #>
$httpVerb = 'DELETE'
$resourcePath = "/sdt/sdts/$sdtid"

<# Construct URL #>
$url = 'https://' + $company + '.logicmonitor.com/santaba/rest' + $resourcePath

<# Get current time in milliseconds #>
$epoch = [Math]::Round((New-TimeSpan -start (Get-Date -Date "1/1/1970") -end (Get-Date).ToUniversalTime()).TotalMilliseconds)

<# Concatenate Request Details #>
$requestVars = $httpVerb + $epoch + $resourcePath

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
$response = Invoke-RestMethod -Uri $url -Method $httpVerb -Header $headers 

<# Print status and body of response #>
$status = $response.status
$body = $response.data | ConvertTo-Json -Depth 5

Write-Host "Status:$status"
Write-Host "Response:$body"