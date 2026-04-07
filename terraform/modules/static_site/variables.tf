variable "env" {    
  type = string
  default = "dev"  
}

variable "azurerm_resource_group" {
  type = string
  default = "IAC_01042026"
}

variable "azure_location" {
  type = string
  default = "eastasia"
}

variable "domainName" {
  type = string
}