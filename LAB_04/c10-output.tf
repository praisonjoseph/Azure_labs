## Public IP Address
output "linuxvm_public_ip_vm1" {
  description = "Linux VM Public Address 1"
  value = azurerm_public_ip.linuxvm_publicip[0].ip_address
}

output "linuxvm_public_ip_vm2" {
  description = "Linux VM Public Address 2"
  value = azurerm_public_ip.linuxvm_publicip[1].ip_address
}

# Network Interface Outputs
## Network Interface ID
output "linuxvm_network_interface_id_vm1" {
  description = "Linux VM Network Interface ID 1"
  value = azurerm_network_interface.linuxvm_nic[0].id
}

output "linuxvm_network_interface_id_vm2" {
  description = "Linux VM Network Interface ID 2"
  value = azurerm_network_interface.linuxvm_nic[1].id
}
## Network Interface Private IP Addresses
output "linuxvm_network_interface_private_ip_addresses_vm1" {
  description = "Linux VM Private IP Addresses"
  value = [azurerm_network_interface.linuxvm_nic[0].private_ip_addresses]
}
output "linuxvm_network_interface_private_ip_addresses_vm2" {
  description = "Linux VM Private IP Addresses"
  value = [azurerm_network_interface.linuxvm_nic[1].private_ip_addresses]
}
# Linux VM Outputs

## Virtual Machine Public IP
output "linuxvm_public_ip_address_vm1" {
  description = "Linux Virtual Machine Public IP"
  value = azurerm_linux_virtual_machine.linuxvm[0].public_ip_address
}
output "linuxvm_public_ip_address_vm2" {
  description = "Linux Virtual Machine Public IP"
  value = azurerm_linux_virtual_machine.linuxvm[1].public_ip_address
}


## Virtual Machine Private IP
output "linuxvm_private_ip_address_vm1" {
  description = "Linux Virtual Machine Private IP"
  value = azurerm_linux_virtual_machine.linuxvm[0].private_ip_address
}
output "linuxvm_private_ip_address_vm2" {
  description = "Linux Virtual Machine Private IP"
  value = azurerm_linux_virtual_machine.linuxvm[1].private_ip_address
}

## Virtual Machine 128-bit ID
output "linuxvm_virtual_machine_id_vm1_128bit" {
  description = "Linux Virtual Machine ID - 128-bit identifier"
  value = azurerm_linux_virtual_machine.linuxvm[0].virtual_machine_id
}
output "linuxvm_virtual_machine_id_vm2_128bit" {
  description = "Linux Virtual Machine ID - 128-bit identifier"
  value = azurerm_linux_virtual_machine.linuxvm[1].virtual_machine_id
}
## Virtual Machine ID
output "linuxvm_virtual_machine_id_vm1" {
  description = "Linux Virtual Machine ID "
  value = azurerm_linux_virtual_machine.linuxvm[0].id
}

output "linuxvm_virtual_machine_id_vm2" {
  description = "Linux Virtual Machine ID "
  value = azurerm_linux_virtual_machine.linuxvm[1].id
}




