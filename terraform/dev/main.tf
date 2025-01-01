# Resource group
resource "azurerm_resource_group" "rg-dev" {
  name     = "${var.prefix}-${var.rgName}-${var.env}"
  location = var.location

  tags = {
    Environment = var.env
  }
}

