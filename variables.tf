#specify the resource group
variable "resource_group_name" {
  description = "deafault resource group"
  type        = list(string)
  default     = ["NewCO-ETL-dev-rg", "NewCO-ETL-uat-rg", "NewCO-ETL-prod-rg"]
}
variable "location" {
  description = "location where rgs will be created"
  type        = string
  default     = "westus3"
}
variable "redundant_location" {
  description = "Redundant location"
  type        = string
  default     = "eastus"
}
variable "storage_account" {
  description = "storage account name"
  type        = string
  default     = "lntstorage"
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
  default     = "lntserver"
}
variable "mssql_database" {
  description = "mssql database name"
  type        = string
  default     = "lntdatabase"
}