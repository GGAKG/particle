variable "resource_group_name" {
  default = "ci-cd-rg"
}
variable "location" {
  default = "Central India"
}
variable "vnet_name" {
  default = "ci-cd-vnet"
}
variable "vnet_address_space" {
  default = ["10.1.0.0/16"]
}
variable "subnet_prefix" {
  default = "10.1.1.0/24"
}
variable "vm_name" {
  default = "ci-cd-vm"
}
variable "vm_size" {
  default = "Standard_D2dsv5"
}
variable "admin_username" {
  default = "azureuser"
}
variable "ssh_public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
