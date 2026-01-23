variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "subnet_name" {
  description = "AKS Subnet name"
  type        = string
}

variable "subnet_prefix" {
  description = "Subnet CIDR"
  type        = string
}

variable "log_analytics_name" {
  description = "Log Analytics Workspace name"
  type        = string
}

variable "log_analytics_sku" {
  description = "Log Analytics SKU"
  type        = string
}

variable "aks_name" {
  description = "AKS Cluster name"
  type        = string
}

variable "dns_prefix" {
  description = "AKS DNS prefix"
  type        = string
}

variable "node_count" {
  description = "AKS node count"
  type        = number
}

variable "vm_size" {
  description = "AKS node VM size"
  type        = string
}

variable "windows_admin_username" {
  description = "Windows admin username"
  type        = string
}

variable "windows_admin_password" {
  description = "Windows admin password"
  type        = string
  sensitive   = true
}
