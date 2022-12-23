
variable "resource_group" {
  description = "deafault resource group"
  type        = list(string)
  default     = ["dev", "uat", "prod"]
  # default     = ["NewCO-ETL-dev-rg", "NewCO-ETL-uat-rg", "NewCO-ETL-prod-rg"]
}

variable "location" {
  description = "location where rgs will be created"
  type        = string
  default     = "eastus"
}

variable "mssql_server" {
  description = "mssql server name"
  type        = string
  default     = "msqlserver"
}

variable "msqlsrv_username" {
  description = "  administrator_login"
  type        = string
}

variable "msqlsrv_password" {
  description = "  administrator_login"
  type        = string
}

variable "mssql_database" {
  description = "mssql database name"
  type        = string
  default     = "msqldatabase"
}

variable "storage_account" {
  description = "storage account name"
  type        = string
  default     = "nocstorageac"
}

variable "data_lake" {
  description = "storage account name"
  type        = string
  default     = "datalakestorage"
}

variable "key_vault" {
  description = "storage account name"
  type        = string
  default     = "nockeyvault"
}

variable "data_factory" {
  description = "storage account name"
  type        = string
  default     = "noc-datafactory"
}

variable "data_brick" {
  description = "storage account name"
  type        = string
  default     = "noc-databrikcs"
}








/*

variable "env" {
  description = "environment name"
  type        = map(string)
  default = {
    "dev"  = "dev"
    "test" = "test"
    "prod" = "prod"
  }
}

#use when need for a redundant location
variable "redundant_location" {
  description = "Redundant location"
  type        = string
  default     = "westus"
}

*/