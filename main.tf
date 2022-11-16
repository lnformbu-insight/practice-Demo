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

#A variable named resource_group_name, 
variable "resource_group_name" {
  type = string
}

#A variable named location
variable "location" {
  type = string
}

#An Azure resource group (azurerm_resource_group) that consumes both the resource_group_name and location variables.
resource "azurerm_resource_group" "ARG-GPS" {
  name     = var.resource_group_name
  location = var.location

}




