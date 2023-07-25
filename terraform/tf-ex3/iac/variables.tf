#######################
# Vnet + Subnet
variable "vnet_name" {
  type        = string
  description = "Vnet name in Azure"
  default     = "minecraft-vnet"
}
variable "vnet_ip" {
  type        = string
  description = "Vnet ip in Azure"
  default     = "100.1.0.0/16"
}
variable "sub_name" {
  type        = string
  description = "SubNet name in Azure"
  default     = "minecraft-sub"
}
variable "sub_ip" {
  type        = list(string)
  description = "SubNet ip in Azure"
  default     = ["100.1.1.0/24"]
}
###########################
# VM VARS
variable "vm_name" {
  type        = string
  description = "VM name in Azure"
  default     = "minecraft-vm"
}
variable "admin_user" {
  type        = string
  description = "user name in vm"
  default     = "minecraft"
}
####
# RG
variable "rg" {
  type        = string
  description = "RG name in Azure"
  default     = "minecraft-rg"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "eastus"
}
##############################################
# Servers vars
variable "vm_size" {
  type        = string
  description = "vm size"
  default     = "Standard_B2s"
}
variable "m_disk_size" {
  type        = string
  description = "string in GB"
  default     = "100"
}
variable "sa_type" {
  type        = string
  description = "user name in vm"
  default     = "Standard_LRS"
}
