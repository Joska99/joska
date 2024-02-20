###################
# Public IP Address
resource "azurerm_public_ip" "pip" {
  name                = "win-vm-pip"
  location            = var.location
  resource_group_name = var.rg
  allocation_method   = "Static"
}
###################
# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "win-vm-nic"
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    name                          = "win-vm-ip-config"
    subnet_id                     = var.sub_name
    public_ip_address_id          = azurerm_public_ip.pip.id
    private_ip_address_allocation = "Dynamic"
  }
}
#######################
# WIN Virtual Machine
resource "azurerm_windows_virtual_machine" "example" {
  name                = var.vm_name
  resource_group_name = var.rg
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_user
  admin_password      = var.admin_pwd
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.sa_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

