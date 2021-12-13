
###################################################################################

output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet_1.id
}

output "vnet_name" {
  description = "The name of the newly created vNet"
  value       = azurerm_virtual_network.vnet_1.name
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = azurerm_virtual_network.vnet_1.location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet_1.address_space
}

output "vnet_subnet_1" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = azurerm_subnet.subnet_1.*.id
}

###################################################################################

output "vnet_id2" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet_2.id
}

output "vnet_name2" {
  description = "The name of the newly created vNet"
  value       = azurerm_virtual_network.vnet_2.name
}

output "vnet_location2" {
  description = "The location of the newly created vNet"
  value       = azurerm_virtual_network.vnet_2.location
}

output "vnet_address_space2" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet_2.address_space
}

output "vnet_subnet_2" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = azurerm_subnet.subnet_2.*.id
}

###################################################################################

output "vnet_id3" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet_2.id
}

output "vnet_name3" {
  description = "The name of the newly created vNet"
  value       = azurerm_virtual_network.vnet_2.name
}

output "vnet_location3" {
  description = "The location of the newly created vNet"
  value       = azurerm_virtual_network.vnet_2.location
}

output "vnet_address_space3" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet_2.address_space
}

output "vnet_subnet_3" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = azurerm_subnet.subnet_3.*.id
}
###################################################################################



