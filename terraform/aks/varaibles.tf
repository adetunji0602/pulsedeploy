# Resource Group
variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "rg-pulsedeploy"
}

# Location
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "West US 2"
}

# Virtual Network
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "vnet-pulsedeploy"
}

variable "subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
  default     = "snet-aks"
}

variable "subnet_prefix" {
  description = "Address prefix for subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Log Analytics
variable "log_analytics_name" {
  description = "Log Analytics workspace name"
  type        = string
  default     = "log-aks-pulsedeploy"
}

variable "log_analytics_sku" {
  description = "Log Analytics SKU"
  type        = string
  default     = "PerGB2018"
}

# AKS Cluster
variable "aks_name" {
  description = "Name of the AKS Cluster"
  type        = string
  default     = "aks-pulsedeploy"
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
  default     = "aks-pulsedeploy"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for nodes"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "windows_admin_username" {
  description = "Windows admin username for AKS nodes"
  type        = string
  default     = "azureuser"
}

variable "windows_admin_password" {
  description = "Windows admin password for AKS nodes"
  type        = string
  default     = "ReplaceYourStrongPasswordHere123!" # Use secure secrets in real deployment
  sensitive   = true
}
