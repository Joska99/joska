#####
# RG
#####
resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.location
}
##########
# VWAN
##########
resource "azurerm_virtual_wan" "vwan" {
  name                = var.vwan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}
######
# VHUB
resource "azurerm_virtual_hub" "vhub" {
  name                = var.vhub_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  virtual_wan_id      = azurerm_virtual_wan.vwan.id
  address_prefix      = var.vhub_ip
}
# #######################
# resource "azurerm_virtual_hub_connection" "conn_to_hub" {
#   name                      = "admin-vm-to-vhub"
#   virtual_hub_id            = azurerm_virtual_hub.vhub.id
#   remote_virtual_network_id = azurerm_virtual_network.vnet.id
# }
