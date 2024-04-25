resource "azurerm_storage_account" "logic_app_storage_account" {
  name                            = "${var.project_prefix}logicappssa${var.stage}"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.replication_type
  min_tls_version                 = "TLS1_2"
  public_network_access_enabled   = true
  allow_nested_items_to_be_public = false

  network_rules {
    default_action = "Allow"
    bypass         = ["Logging", "Metrics", "AzureServices"]

    private_link_access {
      endpoint_resource_id = "${data.azurerm_subscription.current.id}/resourcegroups/*/providers/Microsoft.Logic/integrationAccounts/*"
      endpoint_tenant_id   = data.azurerm_subscription.current.tenant_id
    }
    private_link_access {
      endpoint_resource_id = "${data.azurerm_subscription.current.id}/resourcegroups/*/providers/Microsoft.Logic/workflows/*"
      endpoint_tenant_id   = data.azurerm_subscription.current.tenant_id
    }
    private_link_access {
      endpoint_resource_id = "${data.azurerm_subscription.current.id}/providers/Microsoft.Security/datascanners/StorageDataScanner"
      endpoint_tenant_id   = data.azurerm_subscription.current.tenant_id
    }

  }
  tags = var.tags
}

data "azurerm_subscription" "current" {
}

resource "azurerm_service_plan" "logic_app_service_plan" {
  name                = "${var.project_prefix}-azure-logic-${var.stage}-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.logic_app_sku_name
  tags                = var.tags
}

resource "azurerm_logic_app_standard" "ft_logic_apps" {
  name                       = "${var.project_prefix}-logic-apps-${var.stage}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_service_plan.logic_app_service_plan.id
  storage_account_name       = azurerm_storage_account.logic_app_storage_account.name
  storage_account_access_key = azurerm_storage_account.logic_app_storage_account.primary_access_key
  virtual_network_subnet_id  = data.azurerm_subnet.logic_app_subnet.id
  version                    = "~4"
  app_settings               = merge(local.common_logic_app_settings, var.logic_app_appsettings)

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "access_policy_kv_APIM" {
  key_vault_id = data.azurerm_key_vault.certificates_vault.id
  tenant_id    = azurerm_logic_app_standard.ft_logic_apps.identity.0.tenant_id
  object_id    = azurerm_logic_app_standard.ft_logic_apps.identity.0.principal_id

  secret_permissions = [
    "Get", "List"
  ]

  key_permissions = [
    "Get", "List"
  ]
}
