############################################################################################################################################################################################################################################
### INSTANCES
############################################################################################################################################################################################################################################

######################################################################################################################
### VMS FOR PUBLIC SUBNET AND ANOTHER
######################################################################################################################
###############################################
### NIC FOR VMS IN PUBLIC SUBNET FOR VMS TO LB
###############################################
resource "azurerm_network_interface" "nic-vm" {
  count               = length(var.nic-names)
  name                = "${var.nic-names[count.index]}-vm-${var.names-sub[0]}-subnet-${count.index+1}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.sub[0].id
    private_ip_address_allocation = "Dynamic"
  }
}

########################################
### CREATE AVALABILITY SET FOR VMs TO LB
########################################
resource "azurerm_availability_set" "a-set" {
  name                = "azurerm_availability_set"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

########################################
### CREATE VM IN PUBLIC SUB FOR EACH NIC
########################################
resource "azurerm_virtual_machine" "vm" {
  count                         = length(azurerm_network_interface.nic-vm)
  name                          = "vm-${var.nic-names[count.index]}-${var.names-sub[0]}-subnet-${count.index+1}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  network_interface_ids         = [azurerm_network_interface.nic-vm[count.index].id]
  vm_size                       = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  availability_set_id           = "${azurerm_availability_set.a-set.id}"
  // Specify the same availability set ID as other VMs in the LB

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "disk-vm-${var.nic-names[count.index]}-${var.names-sub[0]}-subnet"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "os-vm-${var.nic-names[count.index]}-${var.names-sub[0]}-subnet"
    admin_username = var.login-passwd-for-vm[0]
    admin_password = var.login-passwd-for-vm[1]
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

#######################
### VMs for second vnet
#######################
#####################################
### NIC FOR VMS IN ANOTHER-SUB SUBNET
#####################################
resource "azurerm_network_interface" "nic-vm-another-sub" {
  count               = length(var.nic-names-another-sub)
  name                = "${var.nic-names-another-sub[count.index]}-vm-${var.names-sub[2]}-subnet-${count.index+1}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.sub[2].id
    private_ip_address_allocation = "Dynamic"
  }
}

############################################
### CREATE VM IN ANOTHER-SUB SUB FOR EACH NIC
############################################
resource "azurerm_virtual_machine" "vm-another-sub" {
  count                         = length(azurerm_network_interface.nic-vm-another-sub)
  name                          = "vm-${var.nic-names[count.index]}-${var.names-sub[2]}-subnet-${count.index+1}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  network_interface_ids         = [azurerm_network_interface.nic-vm-another-sub[count.index].id]
  vm_size                       = "Standard_DS1_v2"
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "disk-vm-${var.nic-names[count.index]}-${var.names-sub[2]}-subnet"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "os-vm-${var.nic-names[count.index]}-${var.names-sub[2]}-subnet"
    admin_username = var.login-passwd-for-vm[0]
    admin_password = var.login-passwd-for-vm[1]
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

######################################################################################################################
### Create Load Balancer
######################################################################################################################
####################
### PUBLIC IP FOR LB
####################
resource "azurerm_public_ip" "pip-lb" {
  name                = "pip-${var.load-balancer}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

#######################
### BACKEND POOL FOR LB
#######################
resource "azurerm_lb_backend_address_pool" "pool-lb" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "pool-${var.load-balancer}"
}

########################
### Create Probe FOR LB
#######################
resource "azurerm_lb_probe" "ssh-inbound-probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "ssh-inbound-probe-${var.load-balancer}"
  port            = 22
}

#######
### LB
######
resource "azurerm_lb" "lb" {
  name                = var.load-balancer
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = "front-pip-${var.load-balancer}"
    public_ip_address_id = azurerm_public_ip.pip-lb.id
  }
}

##############################
### Create Loadbalancing Rules
##############################
resource "azurerm_lb_rule" "production-inbound-rules" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "ssh-inbound-rule"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "front-pip-${var.load-balancer}"
  probe_id                       = azurerm_lb_probe.ssh-inbound-probe.id
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.pool-lb.id}"]
}

########################################################
### Add the virtual machines to the backend address pool
########################################################
resource "azurerm_network_interface_backend_address_pool_association" "vms-ass-pool" {
  depends_on              = [azurerm_network_interface.nic-vm]
  count                   = length(azurerm_network_interface.nic-vm)
  network_interface_id    = azurerm_network_interface.nic-vm[count.index].id
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool-lb.id
  ip_configuration_name   = azurerm_network_interface.nic-vm[count.index].ip_configuration[0].name
}
