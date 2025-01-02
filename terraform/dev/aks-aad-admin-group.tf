resource "azuread_group" "aks-admin-group" {
  display_name     = "${var.prefix}-aks-admin-${var.env}"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}

resource "azuread_group_member" "aks-admin-group-member" {
  group_object_id  = azuread_group.aks-admin-group.id
  member_object_id = data.azuread_user.gb.object_id

}