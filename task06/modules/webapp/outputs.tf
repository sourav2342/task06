output "app_hostname" {
  value       = azurerm_linux_web_app.this.default_hostname
  description = "app hostname"
}