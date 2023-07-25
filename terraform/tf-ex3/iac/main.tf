#####
# RG
#####
resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.location
}
#################
# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_ip]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
########
# Subnet
resource "azurerm_subnet" "sub" {
  name                 = var.sub_name
  address_prefixes     = var.sub_ip
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
###################
# Public IP Address
resource "azurerm_public_ip" "pip" {
  name                = "minecraft-vm-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}
###################
# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "minecraft-vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "minecraft-vm-ip-config"
    subnet_id                     = azurerm_subnet.sub.id
    public_ip_address_id          = azurerm_public_ip.pip.id
    private_ip_address_allocation = "Dynamic"
  }
}
##################################
# Generate key for ssh to linux vm
resource "tls_private_key" "linux_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
#######################
# Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = var.admin_user
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]
  admin_ssh_key {
    username   = var.admin_user
    public_key = tls_private_key.linux_key.public_key_openssh
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.sa_type
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.nic,
    tls_private_key.linux_key,
    azurerm_managed_disk.disk
  ]

}
resource "azurerm_managed_disk" "disk" {
  name                 = "minecraft-server-disk"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = var.sa_type
  create_option        = "Empty"
  disk_size_gb         = var.m_disk_size
}

resource "azurerm_virtual_machine_data_disk_attachment" "attach-disk" {
  depends_on         = [azurerm_linux_virtual_machine.vm]
  managed_disk_id    = azurerm_managed_disk.disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.vm.id
  lun                = "1"
  caching            = "ReadWrite"
}

resource "null_resource" "local" {
  depends_on = [azurerm_linux_virtual_machine.vm, azurerm_virtual_machine_data_disk_attachment.attach-disk]
  provisioner "local-exec" {
    command     = ". ../scripts/local.sh"
    interpreter = ["/bin/bash", "-c"]
    environment = {
      SERVER_PIP = azurerm_public_ip.pip.ip_address
    }
  }
}
#############
# NSG for SSH
resource "azurerm_network_security_group" "nsg" {
  name                = "minecraft-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  # Maintance port
  security_rule {
    name                       = "allow-ssh"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
# # Port for game
resource "azurerm_network_security_rule" "mine" {
  name                        = "MinecraftJava_Port"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "25565"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
################
# NSG Assosiate
resource "azurerm_subnet_network_security_group_association" "assos-nsg" {
  subnet_id                 = azurerm_subnet.sub.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
