## azure provider and version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
}

## config provider
provider "azurerm" {
  features {}
}


#############################################################################################################################################
### POSGRESQL
#################################################################################################################################################################
##########
### SRVER
##########
resource "azurerm_postgresql_server" "serv" {
  name                = "postgresql-server-1-2228420-joska"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "B_Gen5_2"
  storage_mb                   = 5120
  backup_retention_days        = 7


  administrator_login          = var.login-passwd-for-vm[0]
  administrator_login_password = var.login-passwd-for-vm[1]
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

#############
### DATABASE
#############
resource "azurerm_postgresql_database" "db" {
  name                = "db-228420-joska"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.serv.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

