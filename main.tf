resource "azurerm_resource_group" "resgrp" {
  for_each = toset(var.resource_group)
  name     = "${local.naming_prefix}-${each.value}-rg"
  location = var.location
}
# Deploy an SQL Database iin each resource created above (dev,uat,prod)
resource "azurerm_storage_account" "stgact" {
  for_each                 = azurerm_resource_group.resgrp
  name                     = "${each.key}${var.storage_account}"
  resource_group_name      = each.value.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}




/*
resource "azurerm_mssql_server" "example" {
  name                         = "example-sqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "test" {
  name           = "acctest-db-d"
  server_id      = azurerm_mssql_server.example.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true

  tags = {
    foo = "bar"
  }
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