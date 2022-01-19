provider "azurerm" {
  features {}
}


resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = "resourcegroup"
  location                 = "West US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
