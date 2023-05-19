####################
# Vnets outputs
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

####################################
# VMs outputs
output "pip" {
  value = azurerm_public_ip.pip.ip_address
}
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
######################################################
# We can then use this key to connect to our Linux VM
resource "local_file" "linuxkey" {
  filename = "linuxkey.pem"
  content  = tls_private_key.linux_key.private_key_pem
}
