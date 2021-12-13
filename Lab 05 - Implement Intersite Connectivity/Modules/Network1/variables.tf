########## VNET 3#############################

variable "resource_group_name" {
  description = "The name of an existing resource group to be imported."
  type        = string
}

variable "vnet_name" {
  description = "Name of the vnet to create."
  type        = string
  default     = "az104-05-vnet0"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = string
  default     = "10.50.0.0/22"
}

variable "address_spaces" {
  description = "The list of the address spaces that is used by the virtual network."
  type        = list(string)
  default     = []
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.50.0.0/24"]
}

variable "subnet_names1" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet0"]
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    environment = "dev"
  }
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = "A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false."
  type        = map(bool)
  default     = {}
}

variable "subnet_service_endpoints" {
  description = "A map with key (string) `subnet name`, value (list(string)) to indicate enabled service endpoints on the subnet. Default value is []."
  type        = map(list(string))
  default     = {}
}

########## VNET 2#############################

variable "vnet_name2" {
  description = "Name of the vnet to create."
  type        = string
  default     = "az104-05-vnet1"
}

variable "address_space2" {
  description = "The address space that is used by the virtual network."
  type        = string
  default     = "10.51.0.0/22"
}

variable "address_spaces2" {
  description = "The list of the address spaces that is used by the virtual network."
  type        = list(string)
  default     = []
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers2" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}

variable "subnet_pre_fixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.51.0.0/24"]
}

variable "subnet_names2" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet1"]
}

variable "tags2" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    environment = "dev"
  }
}

variable "subnet_enforce_private_link_endpoint_network_policies2" {
  description = "A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false."
  type        = map(bool)
  default     = {}
}

variable "subnet_service_endpoints2" {
  description = "A map with key (string) `subnet name`, value (list(string)) to indicate enabled service endpoints on the subnet. Default value is []."
  type        = map(list(string))
  default     = {}
}

########## VNET 3#############################

variable "vnet_name3" {
  description = "Name of the vnet to create."
  type        = string
  default     = "az104-05-vnet2"
}

variable "address_space3" {
  description = "The address space that is used by the virtual network."
  type        = string
  default     = "10.52.0.0/22"
}

variable "address_spaces3" {
  description = "The list of the address spaces that is used by the virtual network."
  type        = list(string)
  default     = []
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers3" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}

variable "subnet_pre_fixes3" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.52.0.0/24"]
}

variable "subnet_names3" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet2"]
}

variable "tags3" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    environment = "dev"
  }
}

variable "subnet_enforce_private_link_endpoint_network_policies3" {
  description = "A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false."
  type        = map(bool)
  default     = {}
}

variable "subnet_service_endpoints3" {
  description = "A map with key (string) `subnet name`, value (list(string)) to indicate enabled service endpoints on the subnet. Default value is []."
  type        = map(list(string))
  default     = {}
}