

# deploys a Azure Data bricks  3R/RG CREATED
resource "azurerm_databricks_workspace" "databrick" {
  for_each            = azurerm_resource_group.resgrp
  name                = "${each.key}-${var.data_brick}"
  resource_group_name = each.value.name
  location            = var.location
  sku                 = "standard"
}





/*
#codes for possible use


#might need this for sql_database (doubel check later)
resource "azurerm_storage_account" "storact" {
  for_each                 = azurerm_resource_group.resgrp
  name                     = "${each.key}${var.storage_account}"
  resource_group_name      = each.value.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


###########################################################################
###########################################################################

# sample from Evan
resource "azurerm_resource_group" "resgrp" {
  for_each = toset(var.resource_group_name)
  name     = each.value
  location = var.location
}
# Deploy an SQL Database iin each resource created above (dev,uat,prod)
resource "azurerm_storage_account" "stgact" {
  for_each                 = toset(azurerm_resource_group.resgrp)
  name                     = var.storage_account.each.value
  resource_group_name      = each.value.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
*/