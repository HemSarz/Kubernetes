data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}
data "azuread_client_config" "current" {}

data "azuread_application" "tfazspn" {
  display_name = "tfazspn"
}