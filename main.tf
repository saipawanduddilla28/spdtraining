terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.114.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

## Create a resource group
#resource "azurerm_resource_group" "my-RG" {
#  name     = "spdtrainingRG"
#  location = "centralindia"
#}

resource "azurerm_virtual_network" "vnetdeploy" {
  name                = "spd-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.my-RG.location
  resource_group_name = azurerm_resource_group.my-RG.name
}