variable "stage" {
  description = "The stage of the environment."
}

variable "project_prefix" {
  description = "The prefix to use for all resources in this project."
}

variable "replication_type" {
  description = "The type of replication to use for the storage account. Can be either LRS, GRS, RAGRS, or ZRS."
}

variable "account_tier" {
  description = "The Tier to use for this storage account. Can be either Standard or Premium."
}

variable "location" {
  description = "The location/region in which the storage account will be created."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "logic_app_config" {
  description = "A list of containers to create in the storage account."
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

variable "common_artifacts_rg_name" {
  description = "The name of the resource group to deploy common artifacts"
}

variable "common_keyvault_name" {
  description = "The name of the keyvault to deploy common artifacts"
}

variable "storage_account_endpoint" {
  description = "The storage account endpoint"
}
