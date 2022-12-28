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

  tags = {
    environment = "uat"
  }
}

resource "azurerm_mssql_server" "msqlsrv" {
  name                         = var.mssql_server
  resource_group_name          = azurerm_resource_group.resgrp.name
  location                     = azurerm_resource_group.resgrp.location
  version                      = "12.0"
  administrator_login          = var.msqlsrv_username
  administrator_login_password = var.msqlsrv_password

  tags = {
    environment = "uat"
  }
}

resource "azurerm_mssql_database" "msqldb" {
  name           = var.mssql_database
  server_id      = azurerm_mssql_server.msqlsrv.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true

  tags = {
    environment = "uat"
  }
}