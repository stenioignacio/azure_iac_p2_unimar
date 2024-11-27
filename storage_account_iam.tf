resource "azurerm_role_assignment" "service_user_role" {
  scope                = azurerm_storage_account.service_user.id
  role_definition_name = var.service_user_role_definition_name
  principal_id         = azurerm_user_assigned_identity.service_user_identity.principal_id

  depends_on = [azurerm_resource_group.rg_clinical]
}

resource "azurerm_user_assigned_identity" "service_user_identity" {
  resource_group_name = azurerm_resource_group.rg_clinical.name
  location            = azurerm_resource_group.rg_clinical.location
  name                = "${azurerm_storage_account.service_user.name}-identity"

  depends_on = [azurerm_resource_group.rg_clinical]
}
