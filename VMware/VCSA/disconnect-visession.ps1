$user = 'service@vsphere.local'
$pass = 'a47Wz3axkAB6*38Pnvym'
$vcsa01 = 'pdivcsa-01.powerdesigninc.us'
$VCServerName = “pdivcsa-01.powerdesigninc.us” 
    $HoursOld = 1        # Modify value at your pleasure 
    $VC = Connect-VIServer -Server $vcsa01 -Protocol https -User $user -Password $pass | Out-Null
    $ServiceInstance = Get-View ServiceInstance 
    $SessionManager = Get-View $ServiceInstance.Content.SessionManager 
    $SessionManager.SessionList | 
       Where {$_.LastActiveTime -lt (Get-Date).AddHours(-$HoursOld)} | 
       % {$SessionManager.TerminateSession($_.Key)} 
    Disconnect-VIServer -server * -Confirm:$False