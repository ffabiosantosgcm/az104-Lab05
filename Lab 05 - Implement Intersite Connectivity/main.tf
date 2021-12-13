# Lab 04 - Implement Virtual Networking

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "az104-05-rg"
  location = "eastus"
}

module "linuxservers" {
  source              = "./Modules/LinuxUbuntu"
  resource_group_name = azurerm_resource_group.example.name
  vm_os_simple        = "UbuntuServer"
  #public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
  vnet_subnet_id = module.network1.vnet_subnet_1[0]

  depends_on = [azurerm_resource_group.example]
}

module "linuxservers_2" {
  source              = "./Modules/LinuxUbuntu_2"
  resource_group_name = azurerm_resource_group.example.name
  vm_os_simple_2        = "UbuntuServer"
  #public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
  vnet_subnet_id_2 = module.network1.vnet_subnet_2[0]

  depends_on = [azurerm_resource_group.example]
}

module "linuxservers_3" {
  source              = "./Modules/LinuxUbuntu_3"
  resource_group_name = azurerm_resource_group.example.name
  vm_os_simple_3        = "UbuntuServer"
  #public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
  vnet_subnet_id_3 = module.network1.vnet_subnet_3[0]

  depends_on = [azurerm_resource_group.example]
}

module "network1" {
  source              = "./Modules/Network1"
  resource_group_name = azurerm_resource_group.example.name
  subnet_prefixes     = ["10.50.0.0/24", "10.51.0.0/24", "10.52.0.0/24"]
  subnet_names1        = ["subnet0"]
  subnet_names2        = ["subnet1"]
  subnet_names3        = ["subnet2"]

  depends_on = [azurerm_resource_group.example]
}
