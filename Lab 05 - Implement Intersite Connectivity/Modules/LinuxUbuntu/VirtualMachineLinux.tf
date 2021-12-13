#Azure Generic vNet Module
data "azurerm_resource_group" "LinuxUbuntu" {
  name = var.resource_group_name
}


# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
  name                = "az104-05-pip0"
  location            = "eastus"
  resource_group_name = data.azurerm_resource_group.LinuxUbuntu.name
  allocation_method   = "Dynamic"

  tags = {
    environment = "Terraform Demo"
  }
}

# Create network interface
resource "azurerm_network_interface" "myterraformnic" {
  name                = "az104-05-nic0"
  location            = "eastus"
  resource_group_name = data.azurerm_resource_group.LinuxUbuntu.name
  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = var.vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
  }

  tags = {
    environment = "Terraform Demo"
  }
}

/*
# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
output "tls_private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}
*/
# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
  name                  = "az104-05-vm0"
  location              = "eastus"
  resource_group_name   = data.azurerm_resource_group.LinuxUbuntu.name
  network_interface_ids = [azurerm_network_interface.myterraformnic.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "az104-05-vm0-disco-1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

  }
  os_profile {
    computer_name  = "az104-05-vm0"
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