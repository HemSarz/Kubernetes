data "azurerm_client_config" "current" {

}

data "azuread_client_config" "current" {

}

data "azuread_application" "tfazspn" {
  display_name = "tfazspn"
}

data "azuread_service_principal" "tfazspn" {
  display_name = "tfazspn"
}
