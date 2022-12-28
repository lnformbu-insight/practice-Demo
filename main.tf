#defines the resources and  passes the var.tf and calls the locals.tf 3RGs CREATED

resource "azurerm_resource_group" "resgrp" {
  name     = "${local.naming_prefix}-${each.value}-rg"
  location = var.location
    tags = {
    "Environment"   = "uat"
}
}

# deploys mssql server which is a dependency for running SQLDB  / 3R/RG CREATED

resource "azurerm_mssql_server" "mslsvr" {
  name                         = var.mssql_server
  resource_group_name          = azurerm_resource_group.resgrp
  location                     = azurerm_resource_group.location
  version                      = "12.0"
  administrator_login          = var.msqlsrv_username
  administrator_login_password = var.msqlsrv_password
  tags = {
    "Environment"   = "uat"
}
}
