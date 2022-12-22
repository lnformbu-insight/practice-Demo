resource "azurerm_resource_group" "resgrp" {
  for_each = toset(var.resource_group_name)
  name     = each.value
  location = var.location
}
# Deploy an SQL Database iin each resource created above (dev,uat,prod)
resource "azurerm_storage_account" "stgact" {
  for_each                 = azurerm_resource_group.resgrp
  name                     = var.storage_account
  resource_group_name      = each.value.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

/*
resource "azurerm_mssql_server" "msqlsrv" {
  for_each = azurerm_resource_group.resgrp
  name                         = var.mssql_server
  resource_group_name      = each.value.name
  location                 = var.location
  version                      = "12.0"
  administrator_login          = var.msqlsrv_username
  administrator_login_password = var.msqlsrv_password
}

<<<<<<< HEAD
resource "azurerm_mssql_database" "msqldatabase" {
  for_each = azurerm_resource_group.resgrp
  name           = var.mssql_database
  server_id      = azurerm_mssql_server.msqlsrv.id
=======
resource "azurerm_mssql_server" "msqlsrv" {
  for_each = azurerm_resource_group.resgrp
  name                         = var.mssql_server
  resource_group_name      = each.value.name
  location                 = var.location
  version                      = "12.0"
  administrator_login          = var.msqlsrv_username
  administrator_login_password = var.msqlsrv_password
}

resource "azurerm_mssql_database" "msqldatabase" {
  for_each = azurerm_resource_group.resgrp
  name           = var.mssql_database
  server_id      = each.value.id
>>>>>>> 36c302336cca2c972c177d51f434c4eff66dbe9d
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "BC_Gen5_2"
  zone_redundant = true
} 
<<<<<<< HEAD
*/
=======
>>>>>>> 36c302336cca2c972c177d51f434c4eff66dbe9d
