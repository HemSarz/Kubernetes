variable "prefix" {
  type    = string
  default = "tfaz-k8s"
}

variable "rgName" {
  type    = string
  default = "tfaz-rg"
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
  default = "hemsarz"
}

variable "gh_repo_name" {
  type    = string
  default = "kubernetes"
}

variable "gh_branches" {
  type    = list(string)
  default = ["main", "feat", "release"]
}

variable "gh_env" {
  type    = list(string)
  default = ["dev", "prod", "qa"]
}
