output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "ui_app_name" {
  value = azurerm_linux_web_app.ui.name
}

output "ui_url" {
  value = "https://${azurerm_linux_web_app.ui.default_hostname}"
}

output "api_app_name" {
  value = azurerm_linux_web_app.api.name
}

output "api_url" {
  value = "https://${azurerm_linux_web_app.api.default_hostname}"
}