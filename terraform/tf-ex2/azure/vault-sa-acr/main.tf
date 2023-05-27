#####
# RG
#####
resource "azurerm_resource_group" "rg" {
  name     = var.sec_rg
  location = var.location
}

####################################################################################
# ACR
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr_sku
  admin_enabled       = false

  network_rule_set {
    default_action = "Deny"
    virtual_network {
      action    = "Allow"
      subnet_id = var.admin_sub_id
    }
    virtual_network {
      action    = "Allow"
      subnet_id = var.jen_sub_id
    }
  }
}
###############################################################################################################
# Storage Acc 
# TODO: add variabless
# Create Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Atach admin subnets
  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [var.admin_sub_id, var.jen_sub_id]
  }
}
################################################################################################
# Get Tenant id
data "azurerm_client_config" "current" {}
# Create Key Vault
resource "azurerm_key_vault" "kv" {
  depends_on                      = [data.azurerm_client_config.current]
  name                            = "secret-kv-yonuu"
  location                        = azurerm_resource_group.rg.location
  resource_group_name             = azurerm_resource_group.rg.name
  enabled_for_disk_encryption     = true
  enabled_for_deployment          = true
  enabled_for_template_deployment = true
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  sku_name                        = "standard"


  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
    ]
    certificate_permissions = [
      "Get",
      "List",
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set"
    ]

    storage_permissions = [
      "Get",
      "List",
      "Set"
    ]
  }
  # Assosiate Subnet to Key vault, rquire Microsoft.KeyVault service endpoint
  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
    # Add variables in root module
    ip_rules                   = [var.admin_vnet_ips]
    virtual_network_subnet_ids = [var.admin_sub_id]
  }
}


