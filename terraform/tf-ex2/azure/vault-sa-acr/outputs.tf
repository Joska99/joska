#####################
# VNET outputs
#####################
output "rg_name" {
  value = azurerm_resource_group.rg.name
}
output "rg_location" {
  value = azurerm_resource_group.rg.location
}
#############
# ACR outputs
############
output "acr_id" {
  value = azurerm_container_registry.acr.id
}
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
###########
# SA Outputs
###########
output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}
output "storage_account_id" {
  value = azurerm_storage_account.sa.id
}
####################
# Not for production
output "storage_primary_access_key" {
  value = nonsensitive(azurerm_storage_account.sa.primary_access_key)
}
output "storage_primary_connection_string" {
  value = nonsensitive(azurerm_storage_account.sa.primary_connection_string)
}
###########
# KV Outputs
###########
output "kv_id" {
  value = azurerm_key_vault.kv.id
}
output "kv_uri" {
  value = azurerm_key_vault.kv.vault_uri
}
output "kv_object_id" {
  value = data.azurerm_client_config.current.object_id
}

