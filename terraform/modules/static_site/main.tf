resource "azurerm_resource_group" "arg" {
  name     = "${var.env}-${var.azurerm_resource_group}"
  location = var.azure_location
}

resource "azurerm_static_web_app" "AStaticSite" {
  name                = "TestStaticSite"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_resource_group.arg.location
  sku_size = "Free"
  sku_tier = "Free"
}

resource "azurerm_static_web_app_custom_domain" "customdomain746" {
  static_web_app_id = azurerm_static_web_app.AStaticSite.id
  domain_name       = var.domainName
  validation_type   = "dns-txt-token"
}