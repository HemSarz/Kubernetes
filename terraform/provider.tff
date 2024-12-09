terraform {
  backend "azurerm" {
    resource_group_name  = var.state_resource_group_name
    storage_account_name = var.state_storage_account_name
    container_name       = "tfstatebckndcont"
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

  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
