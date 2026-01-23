resource_group_name = "rg-pulsedeploy-ado"
location            = "West US 2"

vnet_name            = "vnet-pulsedeploy-ado"
subnet_name          = "snet-aks"
subnet_prefix        = "10.0.1.0/24"

log_analytics_name = "log-aks-pulsedeploy-ado"
log_analytics_sku  = "PerGB2018"

aks_name    = "aks-pulsedeploy-ado"
dns_prefix = "aks-pulsedeploy-ado"

node_count = 1
vm_size   = "Standard_D2s_v3"

windows_admin_username = "azureuser"
windows_admin_password = "ReplaceThisWithSecret"
