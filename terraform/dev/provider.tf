terraform {
  backend "azurerm" {
    resource_group_name  = "tfaz-bcknd-rg"
    storage_account_name = "backndtfazstg01"
    container_name       = "tfstatebcknd"
    key                  = "tfstatebcknd"
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.3"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "2.50.0"
    }

    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
