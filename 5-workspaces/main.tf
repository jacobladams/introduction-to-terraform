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
  byte_length = 2
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-demo-${terraform.workspace}-${random_id.random_suffix.hex}"
  location = var.location
}

