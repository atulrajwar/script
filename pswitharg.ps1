param ( 
[string]$applicationId,
[string]$pass,
[string]$tenantid
)

#Write-Host $pass
$password=$pass|ConvertTo-SecureString -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PsCredential($applicationId,$password)
Connect-AzAccount -ServicePrincipal -Credential $Cred -Tenant $tenantid

Get-AzSubscription
Select-AzureSubscription -Default -SubscriptionName "JOBS-PROD-AZURE"
