variable "location" {
  default     = "West Europe"
  description = "deploy region"
  type        = string
}


##############
### INSTANCES
##############
variable "load-balancer" {
  type = string
  default = "lb"
  description = "lb name"
}
variable "nic-names" {
  type        = list(string)
  description = "nic names for vms"
  default     = ["nic-1", "nic-2", "nic-3"]
}
variable "nic-names-another-sub" {
  type        = list(string)
  description = "nic names for vms"
  default     = ["nic-1"]
}
variable "login-passwd-for-vm" {
  type    = list(string)
  default = ["adminuser", "P@ssword1234!"]
}


###########
### NETWORK
###########
variable "ip-ranges-vnet" {
  default     = ["10.0.0.0/16", "10.1.0.0/16"]
  type        = list(string)
  description = "ip ranges for nets"
}
variable "names-vnet" {
  default     = ["vnet-1", "vnet-2"]
  type        = list(string)
  description = "names for vnets, names-vnets = ip-ranges-vnets"
}
variable "ip-ranges-sub" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.1.0.0/24"]
  type        = list(string)
  description = "ip ranges for subnets, ip-ranges-sub = names-sub, need acepteble cider block to ip-ranges-vnet"
}
variable "names-sub" {
  default     = ["public", "private", "another-sub"]
  type        = list(string)
  description = "names for subnets, names-sub = ip-ranges-sub"
}