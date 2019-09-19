param ( 
[string]$applicationId,
[string]$pass,
[string]$tenantid
)

#Write-Host $pass
$password=$pass|ConvertTo-SecureString -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PsCredential($applicationId,$password)
Connect-AzAccount -ServicePrincipal -Credential $Cred -Tenant $tenantid
##param( [String] $test, $test1)

#Write-Host ($password)
#Write-Host ($tenantid)
