

provider "azurerm" {
    features {}
}

provider "databricks" {
  azure_workspace_resource_id = azurerm_databricks_workspace.myworkspace.id
}

data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}



resource "azurerm_resource_group" "rg" {
    name     = "rg2${var.prefix}"
    location = var.azure_region
}

resource "time_sleep" "wait_60_seconds" {
    depends_on = [azurerm_resource_group.rg]
    create_duration = "60s"
}

#resource "azurerm_role_assignment" "role_assignment_github" {
  #scope                = azurerm_resource_group.rg.id
  #role_definition_name = "Owner"
  #principal_id         = var.githubworkflowaccount
  #depends_on           = [azurerm_resource_group.rg, time_sleep.wait_60_seconds]
#}

############################################################