#An Azure resource group (azurerm_resource_group) that consumes both the resource_group_name and location variables.
resource "azurerm_resource_group" "ARG-GPS" {
  name     = var.resource_group_name
  location = var.location
}




