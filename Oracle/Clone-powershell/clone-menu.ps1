$_labn = ''
function Show-Menu
{
     param (
           [string]$Title = 'Oracle Lab refresh Menu'
     )
     cls
     Write-Host "================ $Title ================"
    
     Write-Host "Press '1' for LAB01."
     Write-Host "Press '2' for LAB02."
     Write-Host "Press '3' for LAB03."
     Write-Host "Press '4' for LAB04."
}

do
{
     Show-Menu
     $input = Read-Host "Please make a LAB selection"
     switch ($input)
     {
           '1' {
                $_labn = '01'
               'You chose ' $_labn
           } '2' {
                $_labn = '02'
               'You chose ' $_labn
           } '3' {
                $_labn = '03'
                'You chose ' $_labn
           } '4' {
                $_labn = '04'
                'You chose ' $_labn
           } 'q' {
                return
           }
     }
}
until ($input -eq 'q')