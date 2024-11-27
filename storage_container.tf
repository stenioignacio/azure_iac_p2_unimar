resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.service_user.id
  container_access_type = var.container_access_type

  depends_on = [azurerm_resource_group.rg_clinical, azurerm_storage_account.service_user]
}
