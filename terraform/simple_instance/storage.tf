provider "random" {
}

resource "random_string" "sa_name_affix" {
  length = 8
  special = false
  upper = false
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "trekgroup" {
  name     = "trekgroup-resources"
  location = "West US"
  tags = {
    git_commit           = "a8419034dcda6ce0b338162fbf256d2b2cacb4b5"
    git_file             = "terraform/simple_instance/storage.tf"
    git_last_modified_at = "2022-01-19 06:43:54"
    git_last_modified_by = "87036659+taysmith-test@users.noreply.github.com"
    git_modifiers        = "87036659+taysmith-test"
    git_org              = "taysmith-test"
    git_repo             = "terragoat"
    yor_trace            = "9c1c1d38-eb65-45bd-8086-ea5528ce10c2"
  }
}

resource "azurerm_storage_account" "storagebay" {
  name                     = "storagebay${random_string.sa_name_affix.result}"
  resource_group_name      = azurerm_resource_group.trekgroup.name
  location                 = azurerm_resource_group.trekgroup.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    git_commit           = "a8419034dcda6ce0b338162fbf256d2b2cacb4b5"
    git_file             = "terraform/simple_instance/storage.tf"
    git_last_modified_at = "2022-01-19 06:43:54"
    git_last_modified_by = "87036659+taysmith-test@users.noreply.github.com"
    git_modifiers        = "87036659+taysmith-test"
    git_org              = "taysmith-test"
    git_repo             = "terragoat"
    yor_trace            = "faaf4f2b-e42a-4237-bf6d-ee1b6d5b66fe"
  }
}
