terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.111.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
  }
}


locals {
  resource_group_name="aks-rg1"
  location="North Europe"

  cluster_name="aksdemo1"
}

# Create a resource group
resource "azurerm_resource_group" "demo" {
  name     = local.resource_group_name
  location = local.location  
}

resource "azurerm_kubernetes_cluster" "demo-cluster" {
  name                = local.cluster_name
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  dns_prefix          = "demo-cluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  
  identity {
    type = "SystemAssigned"
  }
}


# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.demo-cluster.kube_config[0].client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value     = azurerm_kubernetes_cluster.demo-cluster.kube_config_raw
#   sensitive = true
# }