resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

data "azurerm_key_vault" "existing" {
  name                = var.existing_kv_name
  resource_group_name = var.existing_kv_rg
}

resource "random_password" "sql_admin" {
  length  = 16
  special = true
}

module "sql" {
  source                         = "./modules/sql"
  location                       = var.location
  resource_group_name            = azurerm_resource_group.main.name
  sql_server_name                = local.sql_server_name
  sql_admin_username             = var.sql_admin_username_secret_name
  sql_admin_password             = random_password.sql_admin.result
  sql_admin_username_secret_name = var.sql_admin_username_secret_name
  sql_admin_password_secret_name = var.sql_admin_password_secret_name

  firewall_rules = [
    {
      name             = "allow-verification-ip"
      start_ip_address = var.allowed_ip_address
      end_ip_address   = var.allowed_ip_address
    },
    {
      name             = "AllowAzureServices"
      start_ip_address = "0.0.0.0"
      end_ip_address   = "0.0.0.0"
    }
  ]
  database_name = local.sql_db_name
  key_vault_id  = data.azurerm_key_vault.existing.id
  sql_sku       = var.sql_sku
  tags          = var.tags
}

module "webapp" {
  source                = "./modules/webapp"
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  app_service_plan_name = local.asp_name
  web_app_name          = local.app_name
  runtime_stack         = var.runtime_stack
  allowed_ip_address    = var.allowed_ip_address
  sql_connection_string = module.sql.sql_connection_string
  sku                   = var.app_service_plan_sku
  tags                  = var.tags
}
