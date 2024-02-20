#################################################################################################################################################################################
### INSTANCES
#################################################################################################################################################################################
###########################
### Create a resource group
###########################
resource "azurerm_resource_group" "rg" {
  name     = var.rg-name
  location = var.location
}


############################################################################################################################################################################################################################################
### NSG FO EACH SUBNET IN EACH VNET
############################################################################################################################################################################################################################################
resource "azurerm_network_security_group" "nsg" {
  count               = length(var.names-sub)
  name                = "nsg-${var.names-sub[count.index]}-subnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

##############################
### NSG ASSOCIATE WITH SUBNETS
##############################
resource "azurerm_subnet_network_security_group_association" "nsg-ass" {
  count                     = length(var.names-sub)
  subnet_id                 = azurerm_subnet.sub[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg[count.index].id
}

##############
### NSG RULES
##############
resource "azurerm_network_security_rule" "rule1" {
  name                        = "SSH"
  priority                    = 1010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg[0].name
}
resource "azurerm_network_security_rule" "rule2" {
  name                        = "HTTP-TO-LB"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg[0].name
}
resource "azurerm_network_security_rule" "rule3" {
  name                        = "ICMP"
  priority                    = 1003
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Icmp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "10.1.0.0/16"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg[0].name
}
resource "azurerm_network_security_rule" "rule4" {
  name                        = "POSTGRES"
  priority                    = 1004
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5432"
  source_address_prefix       = "10.0.1.0/24"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg[0].name
}
resource "azurerm_network_security_rule" "rule5" {
  name                        = "POSTGRES"
  priority                    = 1004
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "5432"
  source_address_prefix       = "10.0.1.0/24"
  destination_address_prefix  = "10.0.2.0/24"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg[1].name
}


#################################################################################################################################################################################
### Create a virtual network within the resource group and subnets
#################################################################################################################################################################################
resource "azurerm_virtual_network" "vnet" {
  count               = length(var.ip-ranges-vnet)
  name                = var.names-vnet[count.index]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["${var.ip-ranges-vnet[count.index]}"]
}

############
### PEERENG
############
resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
  name                      = "vnet1-to-vnet2"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet[0].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[1].id
}
resource "azurerm_virtual_network_peering" "vnet2_to_vnet1" {
  name                      = "vnet2-to-vnet1"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet[1].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[0].id
}

############
### SUBNETS
###########
resource "azurerm_subnet" "sub" {
  count                = length(var.ip-ranges-sub)
  ### if condition for chose vnet
  name                 = count.index<=1? "${var.names-sub[count.index]}-${var.names-vnet[0]}" : "${var.names-sub[count.index]}-${var.names-vnet[1]}"
  resource_group_name  = azurerm_resource_group.rg.name
  ### if condition for chose vnet
  virtual_network_name = count.index<=1? azurerm_virtual_network.vnet[0].name : azurerm_virtual_network.vnet[1].name
  address_prefixes     = [var.ip-ranges-sub[count.index]]
}
