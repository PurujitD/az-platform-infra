resource "azurerm_resource_group" "arg" {
  name     = var.azurerm_resource_group
  location = var.azure_location
}

resource "azurerm_static_web_app" "AStaticSite" {
  name                = "TestStaticSite"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_resource_group.arg.location
  sku_size = "Free"
  sku_tier = "Free"

  repository_url =  var.github_repo_url
  repository_branch = var.github_repo_branch
  repository_token = var.github_repo_token
}

resource "azurerm_static_web_app_custom_domain" "customdomain746" {
  static_web_app_id = azurerm_static_web_app.AStaticSite.id
  domain_name       = "746000.xyz"
  validation_type   = "dns-txt-token"
}

resource "cloudflare_dns_record" "example_dns_record" {
  zone_id = var.zoneId
  name = var.custDomain
  ttl = 3600
  type = "txt"
  comment = "Domain verification record"
  content = azurerm_static_web_app_custom_domain.customdomain746.validation_token
  proxied = false
 }