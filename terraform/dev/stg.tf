resource "azurerm_storage_account" "stg" {
  name                     = "backndtfazstg01"
  resource_group_name      = "tfaz-bcknd-rg"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "cont" {
  name                  = "tfstatebcknd"
  storage_account_id    = azurerm_storage_account.stg.id
  container_access_type = "private"
}