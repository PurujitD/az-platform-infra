variable "azurerm_resource_group" {
  type    = string
  default = "IAC_01042026"
}

variable "env" {
  type    = string
  default = "dev"
}
variable "azure_location" {
  type    = string
  default = "eastasia"
}

variable "azure_subscription_id" { sensitive = true }
variable "azure_tenant_id" {}
variable "azure_client_id" {}
variable "azure_client_secret" { sensitive = true }

variable "github_repo" {
  type = string
}

variable "github_repo_branch" {
  type = string
}

variable "github_repo_token" {
  type      = string
  sensitive = true
}

variable "custDomain" {
  type = string
}

variable "domainName" {
  type = string
}

variable "zoneId" {
  type      = string
  sensitive = true
}

variable "cf_api_token" {
  type      = string
  sensitive = true
}