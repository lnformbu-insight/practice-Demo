#defines the resources and  passes the var.tf and calls the locals.tf 3RGs CREATED

resource "azurerm_resource_group" "resgrp" {
  name     = var.resource_group
  location = var.location
  tags = {
    environment = "uat"
  }
}

resource "azurerm_storage_account" "stract" {
  name                     = var.storage_account
  resource_group_name      = azurerm_resource_group.resgrp.name
  location                 = azurerm_resource_group.resgrp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "mssqlsrv" {
  name                         = var.mssql_server
  resource_group_name          = azurerm_resource_group.resgrp.name
  location                     = azurerm_resource_group.resgrp.location
  version                      = "12.0"
  administrator_login          = var.msqlsrv_username
  administrator_login_password = var.msqlsrv_password
}

resource "azurerm_mssql_database" "mssqldb" {
  name           = var.mssql_database
  server_id      = azurerm_mssql_server.mssqlsrv.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  read_scale     = true
  sku_name       = "S0"

  tags = {
    environment = "uat"
}
}