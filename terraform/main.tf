module "network" {
  source   = "./modules/network"
  location = var.location
}


module "aks" {
  source              = "./modules/aks"
  location            = var.location
  resource_group_name = module.network.rg_name
  private_subnet_ids  = module.network.private_subnet_ids
}


module "ingress" {
  source              = "./modules/ingress"
  location            = var.location
  resource_group_name = module.network.rg_name
}