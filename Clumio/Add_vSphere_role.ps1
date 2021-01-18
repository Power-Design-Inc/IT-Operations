param (
     [string]$Role = $(Read-Host "Role" ),
     [string]$Server = $(Read-Host "Server" )
)

# Read the permissions file
$PermissionsFile = "clumio_permissions.txt"
$Permissions = @()
Get-Content $PermissionsFile | Foreach-Object{
     $Permissions += $_
}

# connect to vCenter and check to see if the role exists
import-Module VMware.VimAutomation.Core
Connect-VIServer -server $Server
$existingRole = Get-VIRole -name $Role
# create or update the role
if (!$existingRole) {
     New-VIRole -name $Role -Privilege (Get-VIPrivilege -Server $Server -id $Permissions) -Server $Server
}
else {
     Set-VIRole -Role $Role -AddPrivilege (Get-VIPrivilege -Server $Server -id $Permissions) -Server $Server
}
Disconnect-VIServer -server $Server -Confirm:$false