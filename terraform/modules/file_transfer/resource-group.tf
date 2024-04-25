resource "azurerm_resource_group" "ft_rg" {
  name     = "ft-resources-${var.stage}"
  location = var.location
  tags     = var.tags
}
