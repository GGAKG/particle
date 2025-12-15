terraform {



  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateparticle"
    container_name       = "tfstate"
    key                  = "aks/terraform.tfstate"
  }


  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.12.0"
    }
  }
}