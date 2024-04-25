locals {
  common_logic_app_settings = {
    Sftp_rss_key                          = "@Microsoft.Keyvault(SecretURI=${azurerm_key_vault_secret.logic_app_rss_key.versionless_id})"
    APPINSIGHTS_INSTRUMENTATIONKEY        = azurerm_application_insights.apim_insight.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = azurerm_application_insights.apim_insight.connection_string
    FUNCTIONS_WORKER_RUNTIME              = "node"
    WEBSITE_NODE_DEFAULT_VERSION          = "~18"
    AzureBlob_blobStorageEndpoint         = var.logic_app_config.destination.type == "Blob" && var.logic_app_config.destination.create == true ? azurerm_storage_account.logic_app_destination[0].primary_blob_endpoint : var.logic_app_config.destination.account_endpoint
  }
}

variable "replication_type" {
  description = "The type of replication to use for the storage account. Can be either LRS, GRS, RAGRS, or ZRS."
}

variable "account_tier" {
  description = "The Tier to use for this storage account. Can be either Standard or Premium."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the logic app."
}


variable "location" {
  description = "The location/region in which to create the logic app."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "logic_app_config" {
  description = "A list of destination containers to create in the storage account."
}

variable "project_prefix" {
  description = "The prefix for the project name"
}

variable "stage" {
  description = "The stage of the environment."
}

variable "resource_group_id" {
  description = "The name of the storage account."
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

variable "os_type" {
  description = "The OS type of the logic app. Possible values are Windows and Linux."
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

variable "logic_app_appsettings" {
  default = {}
  description = "The app settings to configure the logic app with."
}
