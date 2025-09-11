terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "giri-st-acc-rg"
    storage_account_name = "giristorage1"
    container_name       = "gcontainer"
    key                  = "dev.tfstate"
    use_azuread_auth     = true
    subscription_id      = "95bc943b-79d8-4936-9c7b-cb9a2334d711"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "95bc943b-79d8-4936-9c7b-cb9a2334d711"
}
