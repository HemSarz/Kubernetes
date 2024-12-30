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

#Get the current version of the Kubernetes service
data "azurerm_kubernetes_service_versions" "current" {
  location        = azurerm_resource_group.rg-dev.location
  include_preview = false
}

# AKSAdminGroupMembers

data "azuread_user" "gb" {
  user_principal_name = "gb@hemensarzalihotmail.onmicrosoft.com"
}