#Azure Generic vNet Module
data "azurerm_resource_group" "LinuxUbuntu_3" {
  name = var.resource_group_name
}


# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip_3" {
  name                = "az104-05-pip3"
  location            = "Brazil South"
  resource_group_name = data.azurerm_resource_group.LinuxUbuntu_3.name
  allocation_method   = "Dynamic"

  tags = {
    environment = "Terraform Demo"
  }
}

# Create network interface
resource "azurerm_network_interface" "myterraformnic_3" {
  name                = "az104-05-nic3"
  location            = "Brazil South"
  resource_group_name = data.azurerm_resource_group.LinuxUbuntu_3.name
  ip_configuration {
    name                          = "myNicConfiguration_3"
    subnet_id                     = var.vnet_subnet_id_3
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myterraformpublicip_3.id
  }

  tags = {
    environment = "Terraform Demo"
  }
}

# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm_3" {
  name                  = "az104-05-vm3"
  location            = "Brazil South"
  resource_group_name   = data.azurerm_resource_group.LinuxUbuntu_3.name
  network_interface_ids = [azurerm_network_interface.myterraformnic_3.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "az104-05-vm3-disco-1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

  }
  os_profile {
    computer_name  = "az104-05-vm3"
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
