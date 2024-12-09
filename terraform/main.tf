# RG
resource "azurerm_resource_group" "tfazk8srg" {
  name     = "${var.prefix}-rg-${var.env}"
  location = "norwayeast"

}

