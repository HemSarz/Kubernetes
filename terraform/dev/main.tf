# Resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-${var.rgName}-${var.env}"
  location = var.location
}

