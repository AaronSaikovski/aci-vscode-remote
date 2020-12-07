##Deploy ARM teplate using powershell

#Login to Azure
Login-AzAccount
    
#Vars
$subscriptionId="<<SUBID>>" 
$resourceGroupName="aci-remote-dev"

#Select Subscription
#Syntax
Select-AzSubscription -SubscriptionId $subscriptionId 

#Create Resource Group
New-AzResourceGroup -Name $resourceGroupName -Location australiaeast

#Deploy ARM template using powershell
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "template.json" -TemplateParameterFile "parameters.json" -AsJob

#Remove Resource Group
#Syntax
#Remove-AzResourceGroup -Name <Name>
#Actual
Remove-AzResourceGroup -Name $resourceGroupName -Force -AsJob