module "logic_apps" {
  source = "../logic_apps"

  account_tier                           = var.account_tier
  common_artifacts_rg_name               = var.common_artifacts_rg_name
  common_keyvault_name                   = var.common_keyvault_name
  location                               = azurerm_resource_group.ft_rg.location
  logic_app_sku_name                     = var.logic_app_sku_name
  logic_app_subnet_name                  = var.logic_app_subnet_name
  logic_app_vnet_security_resource_group = var.logic_app_vnet_security_resource_group
  project_prefix                         = var.project_prefix
  replication_type                       = var.replication_type
  resource_group_id                      = azurerm_resource_group.ft_rg.id
  resource_group_name                    = azurerm_resource_group.ft_rg.name
  stage                                  = var.stage
  tags                                   = var.tags
  vnet_name                              = var.vnet_name
  os_type                                = var.logic_app_os_type
  logic_app_config                       = var.logic_app_config
}
