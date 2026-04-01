terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.66.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.19.0-beta.4"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = var.azure_subscription_id
    tenant_id = var.azure_tenant_id
    client_id = var.azure_client_id
    client_secret = var.azure_client_secret
  # Configuration options
}

provider "cloudflare" {
    api_token = var.cf_api_token
  # Configuration options
}