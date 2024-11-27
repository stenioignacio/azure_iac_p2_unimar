resource "azurerm_resource_group" "rg_clinical" {
  name     = var.rg_name
  location = var.rg_location

  lifecycle {
    create_before_destroy = true
  }
}
