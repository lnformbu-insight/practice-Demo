#An Azure resource group (azurerm_resource_group) that consumes both the resource_group_name and location variables.
resource "azurerm_resource_group" "GPS" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_storage_account" "STAC" {
  name                     = "lenonstorage"
  resource_group_name      = azurerm_resource_group.GPS.name
  location                 = azurerm_resource_group.GPS.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.tags
}


