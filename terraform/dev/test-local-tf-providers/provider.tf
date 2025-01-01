terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
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
    tls = {
      source  = "hashicorp/tls"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "64208b73-267b-43b1-9bb1-649f128147e6"
}