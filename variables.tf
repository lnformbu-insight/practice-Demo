variable "resource_group" {
  description = "deafault resource group"
  type        = string
  default     = "NewCO-ETL-uat-rg"
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