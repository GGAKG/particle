output "rg_name" {
  value = azurerm_resource_group.rg.name
}


output "private_subnet_ids" {
  value = azurerm_subnet.private[*].id
}