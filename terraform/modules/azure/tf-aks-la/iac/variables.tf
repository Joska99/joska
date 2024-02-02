variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
  default     = "aks-rg"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "eastus"
}
variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
  default     = "joska-cluster"
}
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.26.0"
}
variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
  default     = 1
}
variable "log_analytics_name" {
  type        = string
  description = "loganalytics name"
  default     = "eeboitflga"
}
variable "log_analytics_sku" {
  type        = string
  description = "log analytics price tier"
  default     = "PerGB2018"
}
