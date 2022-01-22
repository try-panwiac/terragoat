resource random_string "password" {
  length      = 16
  special     = false
  min_lower   = 1
  min_numeric = 1
  min_upper   = 1
}

variable "prefix" {
  default = "trek"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = "West Europe"
  tags = {
    git_commit           = "b8ccfb742ecd03d8afa1b053d4b152f3479f9dbf"
    git_file             = "terraform/simple_instance/vm.tf"
    git_last_modified_at = "2022-01-22 00:32:53"
    git_last_modified_by = "87036659+taysmith-test@users.noreply.github.com"
    git_modifiers        = "87036659+taysmith-test"
    git_org              = "taysmith-test"
    git_repo             = "terragoat"
    yor_trace            = "9b614884-19bb-494c-8a09-2d2c293360c0"
  }
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags = {
    git_commit           = "b8ccfb742ecd03d8afa1b053d4b152f3479f9dbf"
    git_file             = "terraform/simple_instance/vm.tf"
    git_last_modified_at = "2022-01-22 00:32:53"
    git_last_modified_by = "87036659+taysmith-test@users.noreply.github.com"
    git_modifiers        = "87036659+taysmith-test"
    git_org              = "taysmith-test"
    git_repo             = "terragoat"
    yor_trace            = "8adb3e2f-1b11-4536-9b13-a71a5a009bf1"
  }
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    git_commit           = "b8ccfb742ecd03d8afa1b053d4b152f3479f9dbf"
    git_file             = "terraform/simple_instance/vm.tf"
    git_last_modified_at = "2022-01-22 00:32:53"
    git_last_modified_by = "87036659+taysmith-test@users.noreply.github.com"
    git_modifiers        = "87036659+taysmith-test"
    git_org              = "taysmith-test"
    git_repo             = "terragoat"
    yor_trace            = "05773581-192c-4e80-8947-6767c4540260"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_B1s"

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password${random_string.password.result}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment          = "staging"
    git_commit           = "b8ccfb742ecd03d8afa1b053d4b152f3479f9dbf"
    git_file             = "terraform/simple_instance/vm.tf"
    git_last_modified_at = "2022-01-22 00:32:53"
    git_last_modified_by = "87036659+taysmith-test@users.noreply.github.com"
    git_modifiers        = "87036659+taysmith-test"
    git_org              = "taysmith-test"
    git_repo             = "terragoat"
    yor_trace            = "d8d6a981-2001-45dc-9fa4-d20b01046d9e"
  }
}
