resource "azurerm_dns_zone" "public_dns_zone" {
  name                = "praisonjoseph.co.in"
  resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_dns_a_record" "public_dns_zone_a" {
  count = 2
  # name                = "public_dns_zone_a"
  name                  = azurerm_linux_virtual_machine.linuxvm[count.index].name
  zone_name           = azurerm_dns_zone.public_dns_zone.name
  resource_group_name = azurerm_resource_group.myrg.name
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.linuxvm_publicip[count.index].id
  # records = [
  #   azurerm_public_ip.linuxvm_publicip[0].ip_address,
  #   azurerm_public_ip.linuxvm_publicip[1].ip_address
  # ]
}
