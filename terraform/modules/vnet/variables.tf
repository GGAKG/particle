variable "resource_group_name" {

}
variable "location" {

}
variable "vnet_name" {

}
variable "subnet_name" {
  default = "default-subnet"
}
variable "address_space" {
  type = list(string)
}
variable "subnet_prefixes" {
  type = list(string)
}
