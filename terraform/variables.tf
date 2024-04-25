locals {
  env = terraform.workspace == "default" ? var.env : terraform.workspace
  tags = {
    Environment  = local.env
    created_by   = "${local.env}-pipeline"
    ServiceName  = "ft INTEGRATION"
  }
}

variable "env" {
  description = "The environment to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  type        = string
}

variable "account_tier" {
  description = "The pricing tier of the account"
}

variable "replication_type" {
  description = "The replication type of the storage account"
}

variable "vnet_name" {
  description = "Vnet needed for APIM"
}

variable "logic_app_vnet_security_resource_group" {
  description = "Security group for APIM Vnet"
}

variable "logic_app_subnet_name" {
  description = "Subnet for APIM VNET configuration"
}

variable "logic_app_os_type" {
  description = "The OS type of the logic app. Can be either Windows or Linux."
}

variable "logic_app_sku_name" {
  description = "The SKU name of the logic app. Possible values are WS1, WS2, etc..."
}

variable "project_prefix" {
  description = "The prefix to use for all resources"
}

variable "sftp_username" {
  description = "The username for the SFTP server"
}

variable "sftp_host" {
  description = "The host for the SFTP server"
}

variable "storage_account_endpoint" {
  description = "The storage account endpoint"
}

variable "common_artifacts_rg_name" {
  description = "The name of the resource group to deploy common artifacts"
}

variable "common_keyvault_name" {
  description = "The name of the keyvault to deploy common artifacts"
}
