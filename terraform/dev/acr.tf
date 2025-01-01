resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg-dev.name
  location            = azurerm_resource_group.rg-dev.location
  sku                 = "Basic"

  tags = {
    Environment = var.env
  }
}