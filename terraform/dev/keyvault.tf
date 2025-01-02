resource "azurerm_key_vault" "kv" {
  name                     = "${var.prefix}-${var.kvname}-${var.env}"
  resource_group_name      = azurerm_resource_group.rg-dev.name
  location                 = var.location
  sku_name                 = var.sku_name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled = false

  tags = {
    Environment = var.env
  }
}
#### Access Policy

resource "azurerm_key_vault_access_policy" "spn" {
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azuread_service_principal.tfazspnName.object_id
  key_vault_id = azurerm_key_vault.kv.id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete"
  ]
}


### Secrets
resource "azurerm_key_vault_secret" "aks-sec-win-node" {
  name         = "aks-node"
  value        = random_password.akspass.result
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.spn
  ]
}

resource "azurerm_key_vault_secret" "aks-sec-ssh-key" {
  name         = "ssh-key"
  value        = tls_private_key.ssh_key.public_key_openssh
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.spn
  ]
}