variable "location" {
  description = "The Azure region to deploy the web app"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "web_app_name" {
  description = "Name of the Web App"
  type        = string
}

variable "runtime_stack" {
  description = "Runtime stack version (e.g. DOTNETCORE|8.0)"
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address allowed to access the Web App"
  type        = string
}

variable "sql_connection_string" {
  description = "SQL connection string passed from SQL module"
  type        = string
  sensitive   = true
}

variable "sku" {
  description = "SKU for the App Service Plan"
  type        = string
}

variable "tags" {
  description = "Tags to apply to web app resources"
  type        = map(string)
}