provider "azurerm" {
  features {}
}

variable "max_pods" {
  default = null
}

resource "azurerm_kubernetes_cluster" "example" {
    name = "checkovAksCluster"
    default_node_pool {
      name = "syspool"
      max_pods = var.max_pods == null ? 51 : 49
    }
}
