terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.53.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.111.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.6.2"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "de7d9b2c-5667-4329-9880-6a954b05e336"

}

# Create a resource group
resource "azurerm_resource_group" "demo" {
  name     = "kubernetes-demo"
  location = var.location
}
