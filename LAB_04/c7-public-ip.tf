# Resource-1: Create Public IP Address
resource "azurerm_public_ip" "linuxvm_publicip" {
  count = 2 
  name = "${local.pip_name}${count.index}"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location 
  allocation_method = "Static"
  sku = "Standard"
  domain_name_label = "${local.pip_name}${count.index}-${random_string.myrandom.id}"
}
