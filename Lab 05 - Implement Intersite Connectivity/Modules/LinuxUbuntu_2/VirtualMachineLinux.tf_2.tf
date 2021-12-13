#Azure Generic vNet Module
data "azurerm_resource_group" "LinuxUbuntu_2" {
  name = var.resource_group_name
}


# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip_2" {
  name                = "az104-05-pip2"
  location            = "eastus"
  resource_group_name = data.azurerm_resource_group.LinuxUbuntu_2.name
  allocation_method   = "Dynamic"

  tags = {
    environment = "Terraform Demo"
  }
}

# Create network interface
resource "azurerm_network_interface" "myterraformnic_2" {
  name                = "az104-05-nic2"
  location            = "eastus"
  resource_group_name = data.azurerm_resource_group.LinuxUbuntu_2.name
  ip_configuration {
    name                          = "myNicConfiguration_2"
    subnet_id                     = var.vnet_subnet_id_2
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myterraformpublicip_2.id
  }

  tags = {
    environment = "Terraform Demo"
  }
}

# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm_2" {
  name                  = "az104-05-vm2"
  location              = "eastus"
  resource_group_name   = data.azurerm_resource_group.LinuxUbuntu_2.name
  network_interface_ids = [azurerm_network_interface.myterraformnic_2.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "az104-05-vm2-disco-1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

  }
  os_profile {
    computer_name  = "az104-05-vm2"
    admin_username = "azurerm"
    admin_password = "P@$$w0rd1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "LAB05"
  }
}
