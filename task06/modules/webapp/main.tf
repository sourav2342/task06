resource "azurerm_service_plan" "this" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.sku
  tags                = var.tags
}

resource "azurerm_linux_web_app" "this" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.this.id

  site_config {
    application_stack {
      dotnet_version = split("|", var.runtime_stack)[1]
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  connection_string {
    name  = "SQL_CONNECTION_STRING"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }

  tags = var.tags
}
