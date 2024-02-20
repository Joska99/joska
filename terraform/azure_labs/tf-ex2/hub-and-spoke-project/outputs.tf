output "ADMIN_VM_PIP" {
  value = module.admin-vm.vm_pip
}
output "WIN_VN_PIP" {
  value = module.win-vm-to-sub.win_vm_pip
}
output "WIN_USR" {
  value = module.win-vm-to-sub.win_vm_user
}
output "WIN_PSWD" {
  value = module.win-vm-to-sub.win_vm_pswd
}
output "JENKINS_ANSIBLE_IP" {
  value = module.jenkins-server.private_ip
}
# output "ACR_IP" {
#   value = module.vault-sa-acr.acr_ip_address
# }

output "KV_URI" {
  value = module.vault-sa-acr.kv_uri
}
output "KV_OBJ_ID" {
  value = module.vault-sa-acr.kv_object_id
}

# output "SA_EP_FQDN" {
#   value = azurerm_private_endpoint.ep_kv.private_service_connection[0]
# }
output "SA_KEY" {
  value = module.vault-sa-acr.storage_primary_access_key
}

