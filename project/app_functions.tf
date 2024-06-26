resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = var.azure_region
}

resource "azurerm_storage_account" "example" {
  name                     = "linuxfappsahruthes"
  resource_group_name      = "name"
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = "example-app-service-plan"
  resource_group_name = "name"
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_function_app" "example" {
  name                = "hruthes-linux-function-app"
  resource_group_name = "name"
  location            = azurerm_resource_group.example.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id

  site_config {}
}