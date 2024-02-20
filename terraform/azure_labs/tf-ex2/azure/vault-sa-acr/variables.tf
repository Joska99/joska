variable "sec_rg" {
  type        = string
  description = "RG name in Azure"
  default     = "network_rg"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "eastus"
}

# To access kv, sa, acr from admin vnet and jenkins
variable "admin_vnet_ips" {
  type        = string
  description = "SubNet name in Azure"
}
variable "admin_sub_id" {
  type        = string
  description = "SubNet name in Azure"
}
variable "jen_vnet_ips" {
  type        = string
  description = "SubNet name in Azure"
}
variable "jen_sub_id" {
  type        = string
  description = "SubNet name in Azure"
}


#######
# SA
#######
variable "sa_name" {
  type        = string
  description = "SubNet name in Azure"
  default     = "sasecsasa"
}
# variable "con_name" {
#   type        = string
#   description = "SubNet name in Azure"
#   default     = "consecconcon"
# }



#######
# ACR
#######
variable "acr_name" {
  type        = string
  description = "ACR name"
  default     = "images4k8syonuu"
}
variable "acr_sku" {
  type        = string
  description = "ACR name"
  default     = "Premium"
}

