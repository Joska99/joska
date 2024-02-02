##############
# VM outputs
output "vm_pip" {
  value = azurerm_public_ip.pip.ip_address
}

resource "local_file" "linuxkey" {
  filename = "adminkey.pem"
  content  = tls_private_key.linux_key.private_key_pem
}
####################
# Vnets outputs
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
