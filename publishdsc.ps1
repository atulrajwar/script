 $applicationId = "5b49358a-1b9e-4f4c-b514-de803f76c0de"
    $pass="abc123"
    $password=$pass|ConvertTo-SecureString -AsPlainText -Force
    $Cred = New-Object System.Management.Automation.PsCredential($applicationId,$password)
    Connect-AzAccount -ServicePrincipal -Credential $Cred -Tenant "1349700e-9024-4337-a837-c59977781d97"

    #$resourceGroup = 'company9'
    #$vmName = 'jumpbox1'
    #$storageAccountName = 'ondemandbackups'

    $parameters =@{
        'Version' = '2.76'
        'ResourceGroupName' = $resourceGroup
        'VMname' = $vmName
        'ArchiveStorageAccountName' = $storageAccountName
        'ArchiveBlobName' = 'webserver-install1.ps1.zip'
        'AutoUpdate' = $true
        'ConfigurationName' =  'webserver'
        
    }

    
    Set-AzVMDscExtension @parameters -Force -Verbose