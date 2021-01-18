$RootPath = "E:\HR\PR_SEC\"

$Folders = dir $RootPath -Recurse | where {$_.psiscontainer -eq $true}


$folders = [array](Get-Item -Path $RootPath)
$folders += Get-ChildItem -Path $RootPath -Recurse -Directory #-Directory requires PS version 3+

$acls = foreach ($Folder in $Folders){
    get-acl $Folder.fullname |
    Select-Object -ExpandProperty Access |
    Where-Object {-not $_.IsInherited} |
    Select-Object -Property *,@{
        'Name' = 'Folder Path'
        'Expression' = {
            $Folder.FullName
    }}
}

$acls | Export-Csv -NoTypeInformation -Path C:\Scripts\NTFS-Permissions.csv
