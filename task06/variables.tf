variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "runtime_stack" {
  description = "Runtime stack version for the web app"
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address to allow through the firewall"
  type        = string
}

variable "sql_admin_username_secret_name" {
  description = "Secret name for SQL admin username in Key Vault"
  type        = string
}

variable "sql_admin_password_secret_name" {
  description = "Secret name for SQL admin password in Key Vault"
  type        = string
}

variable "existing_kv_name" {
  description = "Name of the existing Key Vault"
  type        = string
}

variable "existing_kv_rg" {
  description = "Resource group of the existing Key Vault"
  type        = string
}

variable "sql_sku" {
  description = "SKU for the SQL Database"
  type        = string
}

variable "app_service_plan_sku" {
  description = "SKU for the App Service Plan"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}