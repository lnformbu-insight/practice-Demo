#specify the resource group
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
variable "redundant_location" {
  description = "Redundant location"
  type        = string
  default     = "westus"
}
variable "storage_account" {
  description = "storage account name"
  type        = string
  default     = "storageac"
}
variable "msqlsrv_username" {
  description = "  administrator_login"
  type        = string
}
variable "msqlsrv_password" {
  description = "  administrator_login"
  type        = string
}
variable "mssql_server" {
  description = "mssql server name"
  type        = string
  default     = "msqlserver"
}
variable "mssql_database" {
  description = "mssql database name"
  type        = string
  default     = "msqldatabase"
}
variable "env" {
  description = "environment name"
  type        = map(string)
  default = {
    "dev"  = "dev"
    "test" = "test"
    "prod" = "prod"
  }
}