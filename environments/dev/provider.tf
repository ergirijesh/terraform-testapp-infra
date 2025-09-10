terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }

    backend "azurerm" {
      resource_group_name = "giri-rg-st_acc"
      storage_account_name = "giristacc1"
      container_name = "giri-st-cont"
      key = "dev.terraform.tfstate"

    }
}

provider "azurerm" {
  features {}
  subscription_id = "95bc943b-79d8-4936-9c7b-cb9a2334d711"
}