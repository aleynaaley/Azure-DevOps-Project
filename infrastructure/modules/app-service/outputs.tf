output "lwapp_id" {
    value = azurerm_linux_web_app.lwapp.id
}

output "sp_id" {
    value = azurerm_service_plan.sp.id
}

output "default_hostname" {
  value = azurerm_linux_web_app.lwapp.default_hostname
}
