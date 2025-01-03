resource "random_string" "rgNameString" {
  length  = 4
  special = false
  upper   = false

}

# Resource group
resource "azurerm_resource_group" "rg-dev" {
  name     = "${var.prefix}-${var.rgName}-${random_string.rgNameString.result}-${var.env}"
  location = var.location

  tags = {
    Environment = var.env
  }
}

