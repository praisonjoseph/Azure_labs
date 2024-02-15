# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  name     = format("%s1", local.rg_name)
  location = var.resoure_group_location
}