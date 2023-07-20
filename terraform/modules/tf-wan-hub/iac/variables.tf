variable "rg" {
  type        = string
  description = "RG name in Azure"
  default     = "hub_rg"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "eastus"
}
##############
# VWAN + VHUB
variable "vwan_name" {
  type        = string
  description = "Virtual Wan name"
  default     = "my_vwan"
}
variable "vhub_name" {
  type        = string
  description = "Virtual Wan name"
  default     = "my_vhub"
}
variable "vhub_ip" {
  type        = string
  description = "Virtual Wan name"
  default     = "10.0.0.0/23"
}


