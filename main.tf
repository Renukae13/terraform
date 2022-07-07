terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.12.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "madhudemo-rg"
    storage_account_name = "madhustatefilessg"
    container_name = "statefiles"
    key = "ezAs0PQO+V8wMh5ZUIun7Wos5YLo22ju4FHMrSJ+Sm35x6uMgJinstDUo4fZl3TC23IiD/i9Rvyc+AStR0XFiw=="
    
  }
  }
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "demo-resource" {
name     = var.resource_group_name
location = var.resource_location
}
# Create a resource group
resource "azurerm_resource_group" "demo1-resource" {
name     = var.resource1_group_name
location = var.resource_location
}
resource "azurerm_storage_account" "storage_account" {
    name = var.storage_account
    resource_group_name = azurerm_resource_group.demo-resource.name
    account_replication_type = var.replication_type
    account_tier = var.taier
    location = var.resource_location
}