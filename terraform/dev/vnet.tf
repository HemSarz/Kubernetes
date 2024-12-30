resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-aksVnet-${var.env}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-dev.location
  resource_group_name = azurerm_resource_group.rg-dev.name
}

# AKS Subnet
resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.prefix}-aksSubnet-${var.env}"
  resource_group_name  = azurerm_resource_group.rg-dev.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Backend Subnet
resource "azurerm_subnet" "backend_subnet" {
  name                 = "${var.prefix}-backendSubnet-${var.env}"
  resource_group_name  = azurerm_resource_group.rg-dev.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.prefix}-aksNSG-${var.env}"
  location            = azurerm_resource_group.rg-dev.location
  resource_group_name = azurerm_resource_group.rg-dev.name
}