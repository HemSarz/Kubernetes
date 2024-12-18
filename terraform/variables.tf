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

# AKS Cluster Configuration
variable "aks_name" {
  type        = string
  description = "Name for the AKS Cluster"
  default     = "resume-aks"
}

variable "aks_dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS Cluster"
  default     = "resume"
}

variable "aks_node_pool_name" {
  type        = string
  description = "Name for the default node pool in AKS"
  default     = "default"
}

variable "aks_node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
  default     = 2
}

variable "aks_node_size" {
  type        = string
  description = "Size of the nodes in the default node pool"
  default     = "Standard_DS2_v2"
}

# Cosmos DB Configuration
variable "cosmos_db_name" {
  type        = string
  description = "Name for the Cosmos DB account"
  default     = "resume-db"
}

variable "cosmos_db_offer_type" {
  type        = string
  description = "Offer type for the Cosmos DB account (e.g., Standard, Free)"
  default     = "Standard"
}

# Azure AD B2C Configuration
variable "b2c_auth_name" {
  type        = string
  description = "Name for the Azure AD B2C application"
  default     = "resume-auth"
}

# Azure DNS Configuration
variable "dns_zone_name" {
  type        = string
  description = "Custom domain name for Azure DNS"
  default     = "<replace-with-your-domain>"
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
