module "static_site" {
  source                 = "./modules/static_site"
  env                    = var.env
  azurerm_resource_group = var.azurerm_resource_group
  azure_location         = var.azure_location
  domainName             = var.domainName
}

module "SWA_dns_record" {
  source             = "./modules/cloudflare"
  zoneId             = var.zoneId
  custDomain         = var.custDomain
  az_swa_defaulthost = module.static_site.az_swa_defaulthost
  validation_token   = module.static_site.validation_token
  providers = {
    cloudflare = cloudflare
  }
}

module "gh_actions_secret" {
  source      = "./modules/github"
  github_repo = var.github_repo
  api_key     = module.static_site.api_key
}