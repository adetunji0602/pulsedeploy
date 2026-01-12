variable "resource_group_name" {
  description = "AKS resource group"
  type        = string
  default     = "rg-pulsedeploy"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
  default     = "aks-pulsedeploy"
}

variable "node_count" {
  description = "AKS node count"
  type        = number
  default     = 1
}
