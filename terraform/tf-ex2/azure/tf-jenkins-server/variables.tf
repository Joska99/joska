#################################
# RG VARS
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "eastus"
}
variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
  default     = "jenkins-ansible-rg"
}
#################################
# VNET+SUB VARS
variable "vnet_name" {
  type        = string
  description = "Vnet name in Azure"
  default     = "jenkins-ansible-vnet"
}
variable "vnet_ip" {
  type        = list(string)
  description = "Vnet ip in Azure"
  default     = ["10.88.0.0/16"]
}
variable "sub_name" {
  type        = string
  description = "SubNet name in Azure"
  default     = "jenkins-ansible-sub"
}
variable "sub_ip" {
  type        = list(string)
  description = "SubNet ip in Azure"
  default     = ["10.88.1.0/24"]
}
###########################
# VM VARS
variable "vm_name" {
  type        = string
  description = "VM name in Azure"
  default     = "jenkins-ansible-vm"
}
variable "vm_size" {
  type        = string
  description = "vm size"
  default     = "Standard_D1_v2"
}
variable "admin_pwd" {
  type        = string
  description = "PWD name in VM"
  default     = "J1j2j3j4j5"
}
variable "admin_user" {
  type        = string
  description = "user name in vm"
  default     = "adminuser"
}
variable "sa_type" {
  type        = string
  description = "user name in vm"
  default     = "Standard_LRS"
}
