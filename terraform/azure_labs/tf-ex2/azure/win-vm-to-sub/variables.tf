###########################
# VM VARS
variable "vm_name" {
  type        = string
  description = "VM name in Azure"
  default     = "win-vm"
}
variable "vm_size" {
  type        = string
  description = "vm size"
  #required for wsl2 and Hyper-v
  default = "Standard_D2s_v3"
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
#############################
# Add vars from root moddule
variable "rg" {
  type        = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
}
variable "vnet_name" {
  type        = string
  description = "Vnet name in Azure"
}
variable "sub_name" {
  type        = string
  description = "SubNet name in Azure"
}
