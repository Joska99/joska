###################################################################################################################################################################
# NETWORK RG KV, ACR, SA
###################################################################################################################################################################
module "vault-sa-acr" {
  source = "../azure/vault-sa-acr"
  # Attach admin vnet to allow acces 
  admin_sub_id   = module.admin-vm.subnet_id
  admin_vnet_ips = module.admin-vm.vnet_ip_cidr
  jen_sub_id     = module.jenkins-server.jne_sub_id
  jen_vnet_ips   = module.jenkins-server.jne_ips
}
# ######################
# # Set secrets to Vault
# resource "azurerm_key_vault_secret" "secret1" {
#   depends_on   = [module.admin-vm, module.vault-sa-acr]
#   name         = "adminkey"
#   value        = module.admin-vm.vm_key
#   key_vault_id = module.vault-sa-acr.kv_id
# }
# resource "azurerm_key_vault_secret" "secret2" {
#   depends_on   = [module.jenkins-server, module.vault-sa-acr]
#   name         = "jenkinskey"
#   value        = module.jenkins-server.vm_key
#   key_vault_id = module.vault-sa-acr.kv_id
# }


###################################################################################################################################################################
# CREATE VWAN HUB AND CONECT VNETS
###################################################################################################################################################################
module "hub" {
  source = "../azure/hub"
}
######################
# Connect Vnets to hub
resource "azurerm_virtual_hub_connection" "conn_to_hub" {
  depends_on                = [module.jenkins-server, module.hub]
  name                      = "jenkins-ansible-to-vhub"
  virtual_hub_id            = module.hub.vhub_id
  remote_virtual_network_id = module.jenkins-server.vnet_id
}
resource "azurerm_virtual_hub_connection" "admin_to_hub" {
  depends_on                = [module.admin-vm, module.hub]
  name                      = "admin-to-vhub"
  virtual_hub_id            = module.hub.vhub_id
  remote_virtual_network_id = module.admin-vm.vnet_id
}


###################################################################################################################################################################
# CREATE ADMIN LINUX AND WIN VM AND CONFIGURE JENKINS_ANSIBLE_VM
###################################################################################################################################################################
# ADMIN LINUX VM
module "admin-vm" {
  source = "../azure/admin-vm"
}
##############
# ADMIN WIN VM
module "win-vm-to-sub" {
  source = "../azure/win-vm-to-sub"
  # Deploy to admin subnet
  rg        = module.admin-vm.rg_name
  location  = module.admin-vm.rg_location
  vnet_name = module.admin-vm.vnet_id
  sub_name  = module.admin-vm.subnet_id
}
#############
# PIPLINE VM
module "jenkins-server" {
  source = "../azure/tf-jenkins-server"
}
#########################################################################################
# Exec scripts local.sh (pc) --> admin.sh (admin-vm) --> ansible.sh (jenkins-ansible-vm)
resource "null_resource" "local" {
  depends_on = [module.admin-vm, module.jenkins-server, module.hub, azurerm_virtual_hub_connection.admin_to_hub, azurerm_virtual_hub_connection.conn_to_hub]
  provisioner "local-exec" {
    command     = ". ./scripts/local.sh"
    interpreter = ["/bin/bash", "-c"]
    environment = {
      JENKINS_ANSIBLE_IP = module.jenkins-server.private_ip
      ADMIN_PIP          = module.admin-vm.vm_pip
    }
  }
}
###################################################################################################################################################################
# ADD PRIVATE  DNS TO A ADMIN VNET FOR Jenkins.joska.com
###################################################################################################################################################################
#########################
# CREATE PRIVATE DNS ZONE
resource "azurerm_private_dns_zone" "dns-zone" {
  name                = "joska.com"
  resource_group_name = module.admin-vm.rg_name
}
######################################
# Create Private DNS Zone Network Link
resource "azurerm_private_dns_zone_virtual_network_link" "network_link" {
  name                  = "admin_link"
  resource_group_name   = module.admin-vm.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.dns-zone.name
  virtual_network_id    = module.admin-vm.vnet_id
}
################################
# Create DNS A Record for kv ep
resource "azurerm_private_dns_a_record" "dns_a_kv" {
  name                = "jenkins"
  zone_name           = azurerm_private_dns_zone.dns-zone.name
  resource_group_name = module.admin-vm.rg_name
  ttl                 = 300
  records             = [module.jenkins-server.private_ip]
}

