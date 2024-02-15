resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "contoso.org"
  resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet-link" {
  name                  = "${azurerm_virtual_network.myvnet.name}-${var.private_dns_vnet_link}"
  resource_group_name   = azurerm_resource_group.myrg.name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = azurerm_virtual_network.myvnet.id
  registration_enabled = true
  
}