resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    Team      = ""
    git_org   = "try-panwiac"
    git_repo  = "terragoat"
    team      = "eco"
    yor_trace = "52a4e031-46da-41ed-9f12-b2d776708cdf"
  }
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
    Team        = ""
    git_org     = "try-panwiac"
    git_repo    = "terragoat"
    team        = "eco"
    yor_trace   = "c0cb975c-6408-4935-920c-85e38411e6cf"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
  sensitive = true
}

# Note
output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}
