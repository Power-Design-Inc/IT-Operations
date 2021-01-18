$Logfile = "E:\Accubid-Logs\Log.txt"

Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}

if (test-path "E:\Accubid DB Upload\*") {

    Stop-Service -Name "CTree Server"
        LogWrite -Message "CTree Server successfully stopped" -Severity Information

    Stop-Service -Name AccResolutionEngine6
        LogWrite -Message "Accubid Engine successfully stopped" -Severity Information

    Stop-Service -Name AccDCListener6
        LogWrite -Message "Accubid Listener successfully stopped" -Severity Information

    Get-SmbSession | Close-SmbSession -force
        LogWrite -Message "SMB Sessions successfully closed" -Severity Information

    Get-SmbOpenFile | Close-SmbOpenFile -force
        LogWrite -Message "SMB Files successfully closed" -Severity Information
		
	Remove-Item "E:\Accubid Weekly Backup\*" -Force -Recurse
		LogWrite -Message "Previous weekly backup files successfully deleted" -Severity Information

    move-item "E:\Accubid Data\Databases\PDI MASTER DATABASE CLASSIC 12\*" -Destination "E:\Accubid Weekly Backup" -force
        LogWrite -Message "Accubid files successfully moved to backup location" -Severity Information

    move-item "E:\Accubid DB Upload\*" -Destination "E:\Accubid Data\Databases\PDI MASTER DATABASE CLASSIC 12"
        LogWrite -Message "New Accubid files successfully moved into production" -Severity Information
		
	$acl = Get-Acl "E:\Accubid Data\Databases\PDI MASTER DATABASE CLASSIC 12"
	$acl.SetAccessRuleProtection($false,$true)
	$acl | Set-Acl "E:\Accubid Data\Databases\PDI MASTER DATABASE CLASSIC 12\*"
		LogWrite -Message "ACLs inherited from parent folder successfully" -Severity Information

    Start-Service -Name AccResolutionEngine6
        LogWrite -Message "Accubid Engine successfully started" -Severity Information

    Start-Service -Name AccDCListener6
        LogWrite -Message "Accubid Listener successfully started" -Severity Information
		
	Start-Service -Name "CTree Server"
        LogWrite -Message "CTree Server successfully stopped" -Severity Information

	Send-MailMessage -From 'AccubidDB <AccubidDB@powerdesigninc.us>' -To cfluit@powerdesigninc.us, sbrauner@powerdesigninc.us, bmoore@powerdesigninc.us, amunoz@powerdesigninc.us, hdrawdy@powerdesigninc.us, zwolff@powerdesigninc.us, tmartin@powerdesigninc.us, ascholes@powerdesigninc.us, mverdino@powerdesigninc.us -Subject 'Accubid DB Updated' -Body 'Accubid DB has been updated with recent files' -SmtpServer 'smtp.powerdesigninc.us'
  }
else {
        LogWrite -Message "There is nothing to update - Goodbye" -Severity Information
	Send-MailMessage -From 'AccubidDB <AccubidDB@powerdesigninc.us>' -To cfluit@powerdesigninc.us, sbrauner@powerdesigninc.us, bmoore@powerdesigninc.us, amunoz@powerdesigninc.us, hdrawdy@powerdesigninc.us, zwolff@powerdesigninc.us, tmartin@powerdesigninc.us, ascholes@powerdesigninc.us, mverdino@powerdesigninc.us -Subject 'No Accubid DB Update' -Body 'There are no new files for the accubid DB to update' -SmtpServer 'smtp.powerdesigninc.us'
		exit
  }