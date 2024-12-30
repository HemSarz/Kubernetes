data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}
data "azuread_client_config" "current" {}

data "azuread_application" "tfazspn" {
  display_name = "tfazspn"
}

data "azuread_service_principal" "tfazspnName" {
  display_name = "tfazspn"

}
data "azuread_service_principal" "tfazspn" {
  object_id = data.azuread_service_principal.tfazspnName.object_id
}