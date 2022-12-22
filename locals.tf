locals {
  naming_prefix = "NEWCO-ETL"

  environments = [
    {
      env = "uat"

    },

    {
      env = "dev"

    },

    {
      env = "prod"

    },

  ]
}

















/*
environment_map = {
  for env, config in local.environments : env.env => config
}
  resource "azurerm_resource_group" "example" {
  for_each = local.environment_map
  name     = format("%s-%s-%s", local.naming_prefix, each.key, "rg")
  location = "westus2"
}
*/