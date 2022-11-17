#An Azure resource group (azurerm_resource_group) that consumes both the resource_group_name and location variables.
resource "azurerm_resource_group" "ARG-GPS" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.tags

}


