variable "prefix" {
  type    = string
  default = "tfaz-k8s"
}

variable "prefix_stg" {
  type    = string
  default = "tfazk8s"
}

variable "rgName" {
  type    = string
  default = "rg"
}

variable "location" {
  type    = string
  default = "norwayeast"
}

variable "env" {
  type    = string
  default = "dev"
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

# Federeated Acces VBs

variable "application_display_name" {
  type    = string
  default = "tfazspn"
}

variable "fic_display_name_env" {
  type    = string
  default = "github-actions-fic-env"
}

variable "fic_display_name_branch" {
  type    = string
  default = "github-actions-fic-branch"
}

variable "gh_org_name" {
  type    = string
  default = "HemSarz"
}

variable "gh_repo_name" {
  type    = string
  default = "Kubernetes"
}

variable "gh_branches" {
  type    = list(string)
  default = ["main", "feat", "release"]
}

variable "gh_env" {
  type    = list(string)
  default = ["Dev", "prod", "qa"]
}

# Key Vault
variable "kvname" {
  type    = string
  default = "kv"
}

variable "kv_sku_name" {
  type    = string
  default = "standard"
}

# StorageAccount
variable "stgname" {
  type    = string
  default = "stg"
}

variable "container_name" {
  type    = string
  default = "cont"
}

variable "container_access_type" {
  type    = string
  default = "private"
}
# k8s
variable "aksname" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "aks"
}

variable "k8s_version" {
  description = "Kubernetes version for the AKS cluster"
  type        = string
  default     = "1.19.7"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = string
  default     = "1"
}

variable "node_vm_size" {
  description = "VM size for the nodes in the AKS cluster"
  type        = string
  default     = "Standard_B1"
}

variable "load_balancer_sku" {
  description = "SKU of the load balancer"
  type        = string
  default     = "standard"

}
variable "default_node_pool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "primary"
}

variable "os_disk_type" {
  description = "OS disk Type"
  type        = number
  default     = "Standard_HDD"
}

# Azure container registry
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "tfazacr"
}