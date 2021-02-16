$username = 'svc_mailrelay@powerdesigninc.us'
$password = 'Lexar8080Yeti$'
$smtpserver = 'smtp.powerdesigninc.us'
$fromuser = 'svc_mailrelay@powerdesigninc.us'
$touser = 'tmartin@powerdesigninc.us'
$labn = "05"

$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($username, $secpasswd)


Send-MailMessage -To $touser -From $fromuser  -Subject “LAB$labn Oracle Clone has started” -Credential $mycreds -SmtpServer $smtpserver -Port 587
Start-Sleep -s 5
Send-MailMessage -To $touser -From $fromuser  -Subject “LAB$labn Oracle Clone has finished” -Credential $mycreds -SmtpServer $smtpserver -Port 587