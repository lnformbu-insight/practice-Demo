# Azure Provider source and version being used
terraform {
  required_version = ">= 0.14.8"
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
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}