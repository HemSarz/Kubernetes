resource "random_string" "stgNameNC" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "stg" {
  name                     = "${var.prefix_stg}stg${var.env}${random_string.stgNameNC.result}"
  resource_group_name      = azurerm_resource_group.rg-dev.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
resource "azurerm_storage_container" "cont" {
  name                  = "${var.prefix}-cont-${var.env}"
  storage_account_id    = azurerm_storage_account.stg.id
  container_access_type = var.container_access_type
}