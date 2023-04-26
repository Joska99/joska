# azure provider and version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
  ######################
  # BACKEND FOR .TFSTATE
  ######################
  backend "azurerm" {
    resource_group_name  = "aks-rg"
    storage_account_name = "sa4tstfstate"
    container_name       = "tf-state"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
