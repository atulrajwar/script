
param(

    $resourceGroupName,
    $resourceGroupLocation,
    $cmdbreference,
    $opEnvironment,
    $billingReference,
    $subscriptionName,
    $vnetName,
    #$subnetName,
    $vmName
    #$vmSize,
    #$vmOs,
    #$prividledgeMember
    
)

#this is a script file to deploy az migrate pipeline
# azmigrate.ps1 resourceGroupName=AtulRG resourceGroupLocation='North Europe' cmdbreference=AT987654 opEnvironment=Dev billingReference='BH-100-TU'
# azmigrate AtulRG1,'North Europe',AT987654,Dev,'BH-100-TU'
#AtulRG1 'North Europe' AT987654 Dev 'BH-100-TU' company8 '/subscriptions/2fb07881-1e05-4351-a8ba-28d5119d107a/resourceGroups/AtulRG/providers/Microsoft.Network/virtualNetworks/vnt-az-100' AMVM001

Function CreateResourceGroup([string]$RGname, [string]$rgLocation,[string]$cmdb, [string]$opEnv,[string]$billing, [string]$subscriptionName)
{
     Set-AzContext -Subscription $subscriptionName
    Write-Host "Resource Group Name: $RGname"
    Write-Host "Resource Group Location: ($rgLocation)"

    #Check if RG already exists

    Get-AzResourceGroup -Name $rgName -ErrorVariable notPresent -ErrorAction SilentlyContinue

    if ($notPresent)
    {
        # ResourceGroup doesn't exist
        Write-Host "Going to create new resource Group $rgName"
        
        New-AzResourceGroup -Name $RGname -Location $rgLocation -Tag @{BillingReference=$billing; opEnvironment=$opEnv; cmdbreference=$cmdb}

    }
    else
    {
        # ResourceGroup exist
        Write-Host "Resource Group $rgName Already exists"
    }

}


Function CreateVM([string]$RGname, [string]$rgLocation,[string]$cmdb, [string]$opEnv,[string]$billing)
{

}

function createNetworkCard([string]$RGname, [string]$rgLocation, [string]$vnet, [string]$vmName)
{
# Create a virtual network card and associate it with public IP address and NSG

New-AzNetworkInterface -Name 'fweda-nic' -ResourceGroupName $RGname -SubnetId $vnet.Subnets[0].Id -Location $rgLocation -IpConfigurationName "ipconfig1"
#New-AzNetworkInterface `
          #-Name 'amgrt-nic' `
          #-ResourceGroupName $RGname `
          #-Location $rgLocation `
          #-SubnetId $vnet.Subnets[0].Id `
         # -PublicIpAddressId $pip.Id `
         # -NetworkSecurityGroupId $nsg.Id
}

#Main Execution Started
    $rgName = $resourceGroupName
    $subsName=$subscriptionName
    $Location = $resourceGroupLocation
    $cmdb = $cmdbreference
    $opEnv = $opEnvironment
    $billing = $billingReference

    $virtualNetworkid = $vnetName,
    $subnetName = $subnetName,
    $virtualMachineName= $vmName,
    $virtualMachineSize= $vmSize,
    $vistualMachineOD = $vOs,
    $pmember = $prividledgeMember

    Write-Host "Setting subscription scope"
    $applicationId = "5b49358a-1b9e-4f4c-b514-de803f76c0de"
    $pass="abc123"
    $password=$pass|ConvertTo-SecureString -AsPlainText -Force
    $Cred = New-Object System.Management.Automation.PsCredential($applicationId,$password)
    Connect-AzAccount -ServicePrincipal -Credential $Cred -Tenant "1349700e-9024-4337-a837-c59977781d97"
    
    
   
    Write-Host ("rgname= $rgName")
    #CreateResourceGroup $rgName $Location $cmdb $opEnv $billing $subsName
    createNetworkCard $rgName $Location $virtualNetworkid $virtualMachineName


    