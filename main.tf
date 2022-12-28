#defines the resources and  passes the var.tf and calls the locals.tf 3RGs CREATED

resource "azurerm_resource_group" "resgrp" {
  name     = var.resource_group
  location = var.location
  tags = {
    environment = "uat"
  }
}

resource "azurerm_mysql_server" "msqlsvr" {
  name                = var.mssql_server
  location            = azurerm_resource_group.resgrp.location
  resource_group_name = azurerm_resource_group.resgrp.name

  administrator_login          = var.msqlsrv_username
  administrator_login_password = var.msqlsrv_password

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
  tags = {
    environment = "uat"
  }
}

resource "azurerm_mysql_database" "msqldb" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.resgrp.name
  server_name         = azurerm_mysql_server.msqlsvr.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

}

