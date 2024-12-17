variable "prefix" {
  type    = string
  default = "tfaz-k8s"
}

variable "rgName" {
  type    = string
  default = "tfaz-resume-rg"
}

variable "location" {
  type    = string
  default = "norwayeast"
}

variable "env" {
  type    = string
  default = "prod"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "admin_username" {
  type    = string
  default = "adminuser"
}
