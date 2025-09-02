
resource "azurerm_resource_group" "rgblk1" {
  name     = var.rg_name
  location = var.rg_location
  tags = var.rg_tags
}