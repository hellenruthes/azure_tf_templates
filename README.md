# Config File

# TFState

# Running locally

1. Move to your directory 

`
 cd project
`

` 
    terraform init -backend=true -backend-config="config/local/backend.hcl"
`

` 
    terraform plan -var-file="config/local/terraform.tfvars"
`


# azure_arm_templates
az ad sp create-for-rbac --name "github-deploy-id" --role contributor \
                            --scopes /subscriptions/<id>/resourceGroups/<group> \
                            --json-auth



Connect-AzAccount
Get-AzTenant

az ad sp create-for-rbac --name "githubworkflowaccount2" --role owner --scopes /subscriptions/91dd6738-03c5-4624-b049-6af68a429806/resourceGroups/hruthes-resourcegroup --json-auth

ref https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-github-actions?tabs=userlevel#code-try-0


https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.synapse/synapse-poc
https://roykim.ca/2019/09/22/error-fix-linked-arm-template-the-language-expression-property-templatelink-doesnt-exist/

$resourceGroupDeployment = New-AzResourceGroupDeployment -Name 'hruthes-resourcegroup-Deployment' -ResourceGroupName $hruthes-resourcegroup `
-TemplateUri 'https://raw.githubusercontent.com/RoyKimYYZ/azuredeploy-functionapp-sql-keyvault/master/azuredeploy-functionapp-sql-main.json' `





az ad sp create-for-rbac --name "githubworkflow" --role contributor --scopes subscriptions/570fc7c5-b298-4243-b456-64e446dfb91b/resourceGroups/TOU-Dev --json-auth