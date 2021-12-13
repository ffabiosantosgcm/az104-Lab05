#Azure Generic vNet Module
data "azurerm_resource_group" "network_2" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet-2" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.network_2.name
  location            = data.azurerm_resource_group.network_2.location
  address_space       = length(var.address_spaces) == 0 ? [var.address_space] : var.address_spaces
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet_2" {
  count                                          = length(var.subnet_names)
  name                                           = var.subnet_names[count.index]
  resource_group_name                            = data.azurerm_resource_group.network_2.name
  address_prefixes                               = [var.subnet_prefixes[count.index]]
  virtual_network_name                           = azurerm_virtual_network.vnet-2.name
  enforce_private_link_endpoint_network_policies = lookup(var.subnet_enforce_private_link_endpoint_network_policies, var.subnet_names[count.index], false)
  service_endpoints                              = lookup(var.subnet_service_endpoints, var.subnet_names[count.index], [])
}

