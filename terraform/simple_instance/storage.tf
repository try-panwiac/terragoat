provider "azurerm" {
  features {}
}


resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = "resourcegroup"
  location                 = "West US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    git_commit           = "1d0149bb6f635744b060c574d4baf6c9eeda5e11"
    git_file             = "terraform/simple_instance/storage.tf"
    git_last_modified_at = "2022-01-19 06:35:25"
    git_last_modified_by = "87036659+taysmith-test@users.noreply.github.com"
    git_modifiers        = "87036659+taysmith-test"
    git_org              = "taysmith-test"
    git_repo             = "terragoat"
    yor_trace            = "0a2f7aa8-699c-4129-b2ab-3129edfee232"
  }
}
