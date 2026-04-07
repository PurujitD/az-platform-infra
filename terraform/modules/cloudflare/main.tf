terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.18.0"
    }
  }
  }

resource "cloudflare_dns_record" "example_TXT_record" {
  zone_id = var.zoneId
  name = var.custDomain
  ttl = 3600
  type = "txt"
  comment = "Domain verification record"
  content = var.validation_token
  proxied = false
  depends_on = [ var.validation_token]
}

resource "cloudflare_dns_record" "example_CNAME_record" {
  zone_id = var.zoneId
  name = var.custDomain
  ttl = 1
  type = "CNAME"
  comment = "CNAME record for Azure Static Web App"
  content = var.az_swa_defaulthost
  proxied = true
  depends_on = [ cloudflare_dns_record.example_TXT_record ]
}