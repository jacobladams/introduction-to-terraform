terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.84"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
  required_version = ">= 1.0.11"
}

provider "azurerm" {
  features {}
}

provider "random" {
}

resource "random_id" "random_suffix" {
  byte_length = 3
}

variable "account_replication_type" {
  type        = string
  description = "The replication type to use for the storage account"
}

variable "location" {
  type        = string
  description = "Azure region to deploy the resources"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-demo-${random_id.random_suffix.hex}"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "stterraformdemo${random_id.random_suffix.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = var.account_replication_type
}