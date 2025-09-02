resource "azurerm_container_registry" "acr_blk" {
  name                = var.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
   tags = var.tags
  
}