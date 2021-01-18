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
$headers.Add("Authorization",$auth)
$headers.Add("Content-Type",'application/json')

<# Make Request #>
$response = Invoke-RestMethod -Uri $url -Method $httpVerb -Body $data -Header $headers

<# Print status and body of response1 #>
$status = $response.status
$body = $response.data| ConvertTo-Json -Depth 5

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