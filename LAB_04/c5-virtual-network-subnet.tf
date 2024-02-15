# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                =  format("%s1", local.vnet_name)
  address_space       = ["10.40.0.0/20"]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  tags = local.common_tags
}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  count               = 2 # Change the count as needed
  name                 = format("%s%d", local.snet_name, count.index)
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.40.${count.index}.0/24"]
}

# Create Network Security Group (NSG)
resource "azurerm_network_security_group" "subnet_nsg" {
  name                = "${local.nsg_name}01"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}

# Associate NSG and Linux VM NIC
resource "azurerm_network_interface_security_group_association" "example" {
  count = 2
  network_interface_id      = azurerm_network_interface.linuxvm_nic[count.index].id
  network_security_group_id = azurerm_network_security_group.subnet_nsg.id
}

## Locals Block for Security Rules
locals {
  web_inbound_ports_map = {
    "100" : "80", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "443",
    "120" : "22"
  } 
}

# Create Network Security Rule and associate with NSG
resource "azurerm_network_security_rule" "allow_ssh" {
  for_each = local.web_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  resource_group_name         = azurerm_resource_group.myrg.name
  network_security_group_name = azurerm_network_security_group.subnet_nsg.name
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

# Create Network Security Rule and associate with NSG
resource "azurerm_network_security_rule" "allow_ping" {
  name                        = "AllowPing"
  resource_group_name         = azurerm_resource_group.myrg.name
  network_security_group_name = azurerm_network_security_group.subnet_nsg.name
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Icmp"
  source_port_range           = "*"
  destination_port_range      = "0"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}