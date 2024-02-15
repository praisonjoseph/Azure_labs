locals {
  # Use-case-1: Shorten the names for more readability
  rg_name = "${var.course}-${var.lab}-${var.resoure_group_name}"
  vnet_name = "${var.course}-${var.lab}-${var.virtual_network_name}"
  snet_name = "${var.subnet_name}"
  pip_name = "${var.course}-${var.lab}-${var.publicip_name}"
  nic_name = "${var.course}-${var.lab}-${var.network_interface_name}"
  vm_name = "${var.course}-${var.lab}-${var.virtual_machine_name}"
  nsg_name = "${var.course}-${var.lab}-${var.network_security_group}"
  service_name = "AZ104 Labs"
  owner = "Praison Joseph"
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}