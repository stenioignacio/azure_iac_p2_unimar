resource "azurerm_storage_account" "service_user" {
  name                          = var.storage_account_name
  resource_group_name           = azurerm_resource_group.rg_clinical.name
  location                      = azurerm_resource_group.rg_clinical.location
  account_tier                  = var.storage_account_tier
  account_replication_type      = var.storage_account_replication_type
  public_network_access_enabled = false

  lifecycle {
    create_before_destroy = false
  }

  depends_on = [azurerm_resource_group.rg_clinical]
}

data "azurerm_storage_account_sas" "sas_key" {
  connection_string = azurerm_storage_account.service_user.primary_connection_string
  signed_version    = "2017-07-29"

  resource_types {
    service   = true
    container = false
    object    = false
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2018-03-21T00:00:00Z"
  expiry = "2025-01-01T00:00:00Z"

  permissions {
    read    = true
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = false
    process = false
    tag     = false
    filter  = false
  }
}
