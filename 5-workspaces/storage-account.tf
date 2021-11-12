resource "azurerm_storage_account" "example" {
  name                     = "stterraformdemo${terraform.workspace}${random_id.random_suffic.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = var.account_replication_type
}