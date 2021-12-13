#Azure Generic vNet Module
data "azurerm_resource_group" "network" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet_1" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.network.name
  location            = data.azurerm_resource_group.network.location
  address_space       = length(var.address_spaces) == 0 ? [var.address_space] : var.address_spaces
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet_1" {
  count                                          = length(var.subnet_names1)
  name                                           = var.subnet_names1[count.index]
  resource_group_name                            = data.azurerm_resource_group.network.name
  address_prefixes                               = [var.subnet_prefixes[count.index]]
  virtual_network_name                           = azurerm_virtual_network.vnet_1.name
  enforce_private_link_endpoint_network_policies = lookup(var.subnet_enforce_private_link_endpoint_network_policies, var.subnet_names1[count.index], false)
  service_endpoints                              = lookup(var.subnet_service_endpoints, var.subnet_names1[count.index], [])
}

#Manages a virtual network peering which allows resources to access other resources in the linked virtual network.
resource "azurerm_virtual_network_peering" "peering_vnet_1" {
  name                      = "peer1to2"
  resource_group_name       = data.azurerm_resource_group.network.name
  virtual_network_name      = azurerm_virtual_network.vnet_1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_2.id
}

/*resource "azurerm_virtual_network_peering" "peering_vnet_1_to_3" {
  name                      = "peer1to3"
  resource_group_name       = data.azurerm_resource_group.network.name
  virtual_network_name      = azurerm_virtual_network.vnet_3.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_1.id
}
*/
resource "azurerm_virtual_network" "vnet_2" {
  name                = var.vnet_name2
  resource_group_name = data.azurerm_resource_group.network.name
  location            = data.azurerm_resource_group.network.location
  address_space       = length(var.address_spaces2) == 0 ? [var.address_space2] : var.address_spaces2
  dns_servers         = var.dns_servers2
  tags                = var.tags
}

resource "azurerm_subnet" "subnet_2" {
  count                                          = length(var.subnet_names2)
  name                                           = var.subnet_names2[count.index]
  resource_group_name                            = data.azurerm_resource_group.network.name
  address_prefixes                               = [var.subnet_pre_fixes[count.index]]
  virtual_network_name                           = azurerm_virtual_network.vnet_2.name
  enforce_private_link_endpoint_network_policies = lookup(var.subnet_enforce_private_link_endpoint_network_policies2, var.subnet_names2[count.index], false)
  service_endpoints                              = lookup(var.subnet_service_endpoints2, var.subnet_names2[count.index], [])
}

#Manages a virtual network peering which allows resources to access other resources in the linked virtual network.
resource "azurerm_virtual_network_peering" "peering_vnet_2" {
  name                      = "peer2to1"
  resource_group_name       = data.azurerm_resource_group.network.name
  virtual_network_name      = azurerm_virtual_network.vnet_2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_1.id
}

resource "azurerm_virtual_network" "vnet_3" {
  name                = var.vnet_name3
  resource_group_name = data.azurerm_resource_group.network.name
  location            = "Brazil South"
  address_space       = length(var.address_spaces3) == 0 ? [var.address_space3] : var.address_spaces3
  dns_servers         = var.dns_servers3
  tags                = var.tags
}

resource "azurerm_subnet" "subnet_3" {
  count                                          = length(var.subnet_names3)
  name                                           = var.subnet_names3[count.index]
  resource_group_name                            = data.azurerm_resource_group.network.name
  address_prefixes                               = [var.subnet_pre_fixes3[count.index]]
  virtual_network_name                           = azurerm_virtual_network.vnet_3.name
  enforce_private_link_endpoint_network_policies = lookup(var.subnet_enforce_private_link_endpoint_network_policies3, var.subnet_names3[count.index], false)
  service_endpoints                              = lookup(var.subnet_service_endpoints3, var.subnet_names3[count.index], [])
}


resource "azurerm_virtual_network_peering" "peering_vnet_3_to_1" {
  name                      = "peer3to1"
  resource_group_name       = data.azurerm_resource_group.network.name
  virtual_network_name      = azurerm_virtual_network.vnet_3.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_1.id
}


resource "azurerm_virtual_network_peering" "peering_vnet_3_to_2" {
  name                         = "peer3to2"
  resource_group_name          = data.azurerm_resource_group.network.name
  virtual_network_name         = azurerm_virtual_network.vnet_3.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet_2.id
}
