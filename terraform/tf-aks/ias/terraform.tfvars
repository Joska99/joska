resource_group_name = "aks-rg"
location            = "eastus"
cluster_name        = "joska-cluster"
#az aks get-versions --location eastus ---> to cche enable versions in region
kubernetes_version  = "1.26.0"
system_node_count   = 2
acr_name            = "images4k8s"
log_analytics_name = "eeboitflga"
log_analytics_sku = "PerGB2018"