variable "custDomain" {
  type = string
}

variable "zoneId" {
  type = string
  sensitive = true
}

variable "az_swa_defaulthost" {
  type = string
}

variable "validation_token" {
  type = string
}