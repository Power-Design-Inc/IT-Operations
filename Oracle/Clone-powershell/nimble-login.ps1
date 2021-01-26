# Define clear text string for username and password
[string]$userName = 'tmadmin'
[string]$userPassword = 'Y@p49RBd4z7CMGDSg%qxKj'

# Convert to SecureString
[securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
[pscredential]$credObject = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)

Connect-NSGroup -group 172.27.1.200 -credential $credObject