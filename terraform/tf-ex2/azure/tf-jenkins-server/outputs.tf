####################
# Vnets outputs
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "rg_name" {
  value = azurerm_resource_group.rg.name
}
output "jne_sub_id" {
  value = azurerm_subnet.subnet.id
}
output "jne_ips" {
  value = var.vnet_ip.0
}


#############
# VMs outputs
output "private_ip" {
  value = azurerm_linux_virtual_machine.vm.private_ip_address
}
######################
# Not for production
output "vm_user" {
  value = azurerm_linux_virtual_machine.vm.admin_username
}
output "vm_pswd" {
  value = nonsensitive(azurerm_linux_virtual_machine.vm.admin_password)
}
output "vm_key" {
  value = tls_private_key.linux_key.private_key_pem
}
######################################################
# We can then use this key to connect to our Linux VM
resource "local_file" "linuxkey" {
  filename = "linuxkey.pem"
  content  = tls_private_key.linux_key.private_key_pem
}
