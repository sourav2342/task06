variable "location" {
  description = "The Azure region to deploy SQL resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "sql_server_name" {
  description = "The name of the Azure SQL Server"
  type        = string
}

variable "sql_admin_username" {
  description = "The admin username for the SQL Server"
  type        = string
}

variable "sql_admin_password" {
  description = "The admin password for the SQL Server"
  type        = string
}

variable "firewall_rules" {
  description = "List of firewall rules for the SQL Server"
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
}

variable "database_name" {
  description = "Name of the SQL Database"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the existing Key Vault to store secrets"
  type        = string
}

variable "sql_sku" {
  description = "SKU for the SQL Database"
  type        = string
}

variable "tags" {
  description = "Tags to apply to SQL resources"
  type        = map(string)
}


variable "sql_admin_username_secret_name" {
  description = "Key Vault secret name for SQL admin username"
  type        = string
}

variable "sql_admin_password_secret_name" {
  description = "Key Vault secret name for SQL admin password"
  type        = string
}