# WIP: This file is not used yet

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

# Create a resource group for Something Stochastic blog
resource "azurerm_resource_group" "rg" {
  name     = "somethingstochastic-rg"
  location = uksouth
}
  
