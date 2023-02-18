locals {
  name     = "somethingstochastic"
  location = "uksouth"
  environment = "prod"
  common_tags = {
    project = "somethingstochastic"
    environment = "prod"
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-$(local.name)-$(local.environment)-$(local.location)"
  location = local.location
  tags     = local.common_tags
}

# Azure Static Web App
resource "azurerm_static_site" "staticsite" {
  name                = "ss-$(local.name)-$(local.environment)-$(local.location)"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = local.common_tags
}

# Azure Public DNS Zone
resource "azurerm_public_dns_zone" "dnszone" {
  name                = "somethingstochastic.com"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = local.common_tags
}


# Naming convention
# https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming
# <resource-type>-<workload-name/application>-<environment>-<region>-instance
