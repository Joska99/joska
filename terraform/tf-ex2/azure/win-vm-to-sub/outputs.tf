##############
# VM outputs
output "win_vm_pip" {
  value = azurerm_public_ip.pip.ip_address
}
output "win_vm_user" {
  value = var.admin_user
}
output "win_vm_pswd" {
  value = var.admin_pwd
}

