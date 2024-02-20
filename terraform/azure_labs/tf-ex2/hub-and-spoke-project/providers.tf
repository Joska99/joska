# azure provider and version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>4.0"
    }
  }
  #########################################
  # BACKEND FOR .TFSTATE AND LINUXKEY.PEM
  #########################################
  # backend "azurerm" {
  #   resource_group_name  = var.aks_rg
  #   storage_account_name = var.sa_name
  #   container_name       = var.con_name
  #   key                  = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}
