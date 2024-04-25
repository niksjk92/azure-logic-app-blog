resource "azurerm_storage_account" "logic_app_destination" {
  count                           = var.logic_app_config.destination.create == true ? 1 : 0
  account_replication_type        = var.replication_type
  account_tier                    = var.account_tier
  location                        = var.location
  name                            = trim("${var.project_prefix}${count.index}${var.stage}", "-")
  resource_group_name             = var.resource_group_name
  min_tls_version                 = "TLS1_2"
  public_network_access_enabled   = true
  allow_nested_items_to_be_public = false

  network_rules {
    default_action = "Allow"
    bypass         = ["Logging", "Metrics", "AzureServices"]
  }

  tags = var.tags
}

locals {
  destination_folders = flatten([for key, value in var.logic_app_config.folder_config : [value["destination_folder"]]])
}

resource "azurerm_storage_container" "logic_app_destination" {
  for_each             = var.logic_app_config.destination.create == true ? toset(local.destination_folders) : []
  name                 = lower(each.key)
  storage_account_name = azurerm_storage_account.logic_app_destination[0].name
}
