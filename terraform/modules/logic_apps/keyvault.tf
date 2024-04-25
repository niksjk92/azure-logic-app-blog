
data "azurerm_resource_group" "common_artifacts_rg" {
  name = var.common_artifacts_rg_name
}

data "azurerm_key_vault" "certificates_vault" {
  name                = var.common_keyvault_name
  resource_group_name = data.azurerm_resource_group.common_artifacts_rg.name
}


resource "azurerm_key_vault_secret" "logic_app_rss_key" {
  name         = "logic-app-rss-key"
  value        = "DummyValue. Upload proper RSS KEY through CLI"
  key_vault_id = data.azurerm_key_vault.certificates_vault.id
  lifecycle {
    ignore_changes = [value]
  }
}
