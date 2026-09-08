
resource "azurerm_service_plan" "sp" {
  name                = var.service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "lwapp" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {
    application_stack {
    java_version        = "21"
    java_server         = "JAVA"
    java_server_version = "21-java21"
  }
  }
}