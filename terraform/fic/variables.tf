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
  default = "cloud-resume-challenge-serverless"
}

variable "gh_branches" {
  type    = list(string)
  default = ["main", "feat", "release"]
}

variable "gh_env" {
  type    = list(string)
  default = ["dev", "prod", "qa"]
}
