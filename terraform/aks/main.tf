# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnet
resource "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefix]
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.log_analytics_sku
  retention_in_days   = 30
}

# AKS Cluster (Windows)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = "1.34.1"

  default_node_pool {
    name            = "winpool"
    node_count      = var.node_count
    vm_size         = var.vm_size
    vnet_subnet_id  = azurerm_subnet.aks_subnet.id
    type            = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
  network_plugin    = "azure"
  load_balancer_sku = "standard"
  service_cidr      = "10.1.0.0/16"      # changed to non-overlapping range
  dns_service_ip    = "10.1.0.10"        # must be inside service_cidr
  docker_bridge_cidr = "172.17.0.1/16"   # default is fine
}

  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }

  tags = {
    environment = "dev"
    project     = "pulsedeploy"
  }
}
