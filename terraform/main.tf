terraform {
  required_version = "~>1.6.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.96.0"
    }
  }
  #   backend "azurerm" {
  #     resource_group_name = "config-rg-dev"
  #     storage_account_name = "tfconfig"  #storage account name length limit of 24, also only alphanumerics
  #     container_name = "ft-config" #Container length limit of 24
  #     key                 = "ft.tfstate"
  #   }
}

provider "azurerm" {
  skip_provider_registration = true
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

module "transfer-files" {
  source = "./modules/file_transfer"

  account_tier                           = var.account_tier
  common_artifacts_rg_name               = var.common_artifacts_rg_name
  common_keyvault_name                   = var.common_keyvault_name
  location                               = var.region
  logic_app_os_type                      = var.logic_app_os_type
  logic_app_sku_name                     = var.logic_app_sku_name
  logic_app_subnet_name                  = var.logic_app_subnet_name
  logic_app_vnet_security_resource_group = var.logic_app_vnet_security_resource_group
  project_prefix                         = var.project_prefix
  replication_type                       = var.replication_type
  stage                                  = var.env
  storage_account_endpoint               = var.storage_account_endpoint
  tags                                   = local.tags
  vnet_name                              = var.vnet_name

  logic_app_config = {
    source = {
      host     = var.sftp_host
      username = var.sftp_username
      port     = 22
      type     = "SFTP"
    }
    destination = {
      type             = "Blob"
      create           = false
      account_endpoint = var.storage_account_endpoint
    }
    folder_config = {
      assets = {
        source_root        = "/s3-ft-source-folder"
        destination_folder = "destinationFolder"
      }
    }
  }
}
