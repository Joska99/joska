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
  ######################
  # BACKEND FOR .TFSTATE
  ######################
  # backend "azurerm" {
  #   resource_group_name  = "rg"
  #   storage_account_name = "sa_name"
  #   container_name       = "con-name"
  #   key                  = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}
