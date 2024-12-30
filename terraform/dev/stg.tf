resource "azurerm_storage_account" "stg" {
  name                     = "${var.prefix_stg}stg${var.env}"
  resource_group_name      = "${var.prefix}-rg-${var.env}"
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
resource "azurerm_storage_container" "cont" {
  name                  = "${var.prefix}-cont-${var.env}"
  storage_account_id    = azurerm_storage_account.stg.id
  container_access_type = var.container_access_type
}