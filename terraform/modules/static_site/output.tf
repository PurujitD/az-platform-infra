output "az_swa_defaulthost" {
    description = "The default host name of the Azure Static Web App"
    value       = azurerm_static_web_app.AStaticSite.default_host_name 
}

output "api_key" {
  value = azurerm_static_web_app.AStaticSite.api_key
}

output "validation_token" {
  value = azurerm_static_web_app_custom_domain.customdomain746.validation_token
}