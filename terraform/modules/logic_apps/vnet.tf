data "azurerm_subnet" "logic_app_subnet" {
  name                 = var.logic_app_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.logic_app_vnet_security_resource_group
}
