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

#  repository_url =  var.github_repo_url
#  repository_branch = var.github_repo_branch
#  repository_token = var.github_repo_token
}

resource "azurerm_static_web_app_custom_domain" "customdomain746" {
  static_web_app_id = azurerm_static_web_app.AStaticSite.id
  domain_name       = var.domainName
  validation_type   = "dns-txt-token"

}

resource "cloudflare_dns_record" "example_TXT_record" {
  zone_id = var.zoneId
  name = var.custDomain
  ttl = 3600
  type = "txt"
  comment = "Domain verification record"
  content = azurerm_static_web_app_custom_domain.customdomain746.validation_token
  proxied = false
  depends_on = [ azurerm_static_web_app_custom_domain.customdomain746 ]
 }

 resource "cloudflare_dns_record" "example_CNAME_record" {
  zone_id = var.zoneId
  name = var.custDomain
  ttl = 1
  type = "CNAME"
  comment = "CNAME record for Azure Static Web App"
  content = azurerm_static_web_app.AStaticSite.default_host_name
  proxied = true
  depends_on = [ azurerm_static_web_app_custom_domain.customdomain746 ]
 }
 
resource "github_actions_secret" "az-swa-api-key" {
  repository       =  var.github_repo_url
  secret_name      = "AZURE_STATIC_WEB_APPS_API_TOKEN"
  plaintext_value  = azurerm_static_web_app.AStaticSite.api_key
}
