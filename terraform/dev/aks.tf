resource "random_password" "akspass" {
  length           = 12
  special          = true
  override_special = "_%@"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-${var.aksname}-${var.env}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-dev.name
  dns_prefix          = "${var.prefix}-${var.aksname}-${var.env}"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = azurerm_resource_group.rg-dev.name

  identity {
    type = "SystemAssigned"

  }

  default_node_pool {
    name           = var.default_node_pool_name
    node_count     = var.node_count
    vm_size        = var.node_vm_size
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }


  windows_profile {
    admin_username = var.admin_username
    admin_password = azurerm_key_vault_secret.aks-sec-win-node.value
  }

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = azurerm_key_vault_secret.aks-sec-ssh-key.value
    }
  }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
    admin_group_object_ids = [
      azuread_group.aks-admin-group.id
    ]
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = var.load_balancer_sku
    service_cidr      = "10.1.0.0/16"
    dns_service_ip    = "10.1.0.10"
  }

  tags = {
    Environment = var.env
  }
}

