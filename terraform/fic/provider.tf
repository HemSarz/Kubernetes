terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.109.0"
    }

  }
}

provider "azurerm" {
  features {}
  subscription_id = "64208b73-267b-43b1-9bb1-649f128147e6"
}
