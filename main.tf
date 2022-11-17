#An Azure resource group (azurerm_resource_group) that consumes both the resource_group_name and location variables.
resource "azurerm_resource_group" "GPS" {
  name     = var.resource_group_name
  location = var.location
}

 resource "azurerm_resource_group" "RGNM" {
   name     = "example-resources"
   location = "eastus2"
 }

resource "azurerm_storage_account" "STAC" {
  name                     = "teststroage"
  resource_group_name      = azurerm_resource_group.RGNM.name
  location                 = azurerm_resource_group.RGNM.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.tags
}


