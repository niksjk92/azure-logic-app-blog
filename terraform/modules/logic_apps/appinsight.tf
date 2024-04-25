resource "azurerm_application_insights" "apim_insight" {
  name                = "logic-app-${var.stage}-appinsights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  tags                = var.tags
}
