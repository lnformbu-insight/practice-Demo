# Azure Provider source and version being used
terraform {
  required_version = ">= 0.15.0"
  cloud {
    organization = "insight"
    workspaces {
      name = "Lenon-workspace-demo"
    }
  }
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/hashicorp/azurerm"
      version = "~> 3.0"
    }

    azurerad = {
      source  = "hashicorp/azuread"
      version = "~> 2.31.0"
    }

  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

/*
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Use environment variables for authentication.
provider "databricks" {}

    databricks = {
      source = "databricks/databricks"
    }

*/
