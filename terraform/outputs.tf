output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.main.name
}

output "ui_app_name" {
  description = "UI App Service name"
  value       = azurerm_linux_web_app.ui.name
}

output "api_app_name" {
  description = "API App Service name"
  value       = azurerm_linux_web_app.api.name
}

output "ui_url" {
  description = "UI URL"
  value       = "https://${azurerm_linux_web_app.ui.default_hostname}"
}

output "api_url" {
  description = "API URL"
  value       = "https://${azurerm_linux_web_app.api.default_hostname}"
}