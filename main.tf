#defines the resources and  passes the var.tf and calls the locals.tf 3RGs CREATED

resource "azurerm_resource_group" "resgrp" {
  for_each = toset(var.resource_group)
  name     = "${local.naming_prefix}-${each.value}-rg"
  location = var.location
}

# deploys mssql server which is a dependency for running SQLDB  / 3R/RG CREATED

resource "azurerm_mssql_server" "mslsvr" {
  for_each                     = azurerm_resource_group.resgrp
  name                         = "${each.key}-${var.mssql_server}"
  resource_group_name          = each.value.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.msqlsrv_username
  administrator_login_password = var.msqlsrv_password
}

# Deploys an SQL Database in each resource created above (dev,uat,prod) / 3R/RG CREATED

resource "azurerm_mssql_database" "msldb" {
  for_each     = azurerm_resource_group.resgrp
  name         = "${each.key}-${var.mssql_database}"
  server_id    = azurerm_mssql_server.mslsvr[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "S0"
  max_size_gb  = 2
  #zone_redundant = true
  #read_scale     = true
}

# deploys a storage account which is a dependency for running and storage data late / 3R/RG CREATED

resource "azurerm_storage_account" "storact" {
  for_each                 = azurerm_resource_group.resgrp
  name                     = "${each.key}${var.storage_account}"
  resource_group_name      = each.value.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# deploys a storage datalake gen2 3R/RG CREATED

resource "azurerm_storage_data_lake_gen2_filesystem" "dtlake" {
  for_each           = azurerm_resource_group.resgrp
  name               = "${each.key}-${var.data_lake}"
  storage_account_id = azurerm_storage_account.storact[each.key].id
  # A mapping of Key to Base64-Encoded Values which should be assigned to this Data Lake Gen2 File System.
  /*properties = {
    hello = "aGVsbG8=" 
  } */
}

# deploys a key_vault with permissions 3R/RG CREATED

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  for_each                    = azurerm_resource_group.resgrp
  name                        = "${each.key}-${var.key_vault}"
  location                    = var.location
  resource_group_name         = each.value.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    # more permissions can be define within blocks. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault
    key_permissions = [
      "Get",
      "Create",
      "List",

    ]

    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Delete",
      "Purge",
      "Recover"
    ]

    storage_permissions = [
      "Get",
      "List",
    ]
  }
}


# deploys a Azure Data Factory (Version 2). 3R/RG CREATED

resource "azurerm_data_factory" "dfactory" {
  for_each            = azurerm_resource_group.resgrp
  name                = "${each.key}-${var.data_factory}"
  location            = var.location
  resource_group_name = each.value.name
}


# deploys a Azure Data bricks  3R/RG CREATED

resource "azurerm_databricks_workspace" "databrick" {
  for_each            = azurerm_resource_group.resgrp
  name                = "${each.key}-${var.data_brick}"
  resource_group_name = each.value.name
  location            = var.location
  sku                 = "standard"
}


# deploys a Azure Servive Anlysis  3R/RG CREATED


resource "azurerm_analysis_services_server" "server" {
  for_each            = azurerm_resource_group.resgrp
  name                = "${each.key}${var.serveranalysis}"
  location            = var.location
  resource_group_name = each.value.name
  sku                 = "S0"

  # will update as per customers need. 
  /*
  admin_users             = ["myuser@domain.tld"]
  enable_power_bi_service = true

  ipv4_firewall_rule {
    name        = "myRule1"
    range_start = "210.117.252.0"
    range_end   = "210.117.252.255"
  }

  tags = {
    abc = 123
  }
  */
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