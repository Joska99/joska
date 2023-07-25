##############
# VM outputs
output "vm_pip" {
  value = azurerm_public_ip.pip.ip_address
}
output "minecraft_port" {
  value = azurerm_network_security_rule.mine.destination_port_range
}
resource "local_file" "linuxkey" {
  filename = "akey.pem"
  content  = tls_private_key.linux_key.private_key_pem
}
#############################
# deploy outputs
output "rg_name" {
  value = azurerm_resource_group.rg.name
}
output "rg_location" {
  value = azurerm_resource_group.rg.location
}
