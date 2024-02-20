##############
# VM outputs
output "vm_pip" {
  value = azurerm_public_ip.pip.ip_address
}
resource "local_file" "linuxkey" {
  filename = "adminkey.pem"
  content  = tls_private_key.linux_key.private_key_pem
}
output "vm_key" {
  value = tls_private_key.linux_key.private_key_pem
}
#############################
# Form Win vm deploy outputs
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
output "vnet_ip_cidr" {
  value = var.vnet_ip
}
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
output "rg_name" {
  value = azurerm_resource_group.rg.name
}
output "rg_location" {
  value = azurerm_resource_group.rg.location
}
