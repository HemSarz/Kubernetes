# Ressursgruppe
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-${var.rgName}-${var.env}"
  location = var.location
}

# AKS-klynge
resource "azurerm_kubernetes_cluster" "aks" {
  name                = 
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "resume"
  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
}

# Cosmos DB for besøkstellere
resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "resume-db"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  automatic_failover_enabled = false

  capabilities {
    name = "EnableAggregationPipeline"
  }

  consistency_policy {
    consistency_level = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix = 10000
  }

  geo_location {
    location = var.location
    failover_priority = 0
  }
}

# Azure AD B2C
resource "azurerm_app_service" "b2c_auth" {
  name                = "${var.prefix}-${var.b2c_auth_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_kubernetes_cluster.aks.id
}

# Azure DNS
resource "azurerm_dns_zone" "dns" {
  name                = "hemensarzalihotmail.onmicrosoft.com"
  resource_group_name = azurerm_resource_group.rg.name
}
