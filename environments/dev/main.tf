locals {
  common_tags = {
    "managed_by"  = "terraform"
    "owner"       = "testappteam"
    "Environment" = "dev"
  }

}

module "resource_group" {
  source      = "../../modules/azurerm_resource_group"
  rg_name     = "rg-dev-testapp"
  rg_location = "centralindia"
  rg_tags     = local.common_tags
}

module "container_registry" {
    depends_on = [ module.resource_group ]
  source   = "../../modules/azurerm_container_registry"
  acr_name = "acrdevtestapp"
  rg_name  = "rg-dev-testapp"
  location = "centralindia"
  tags     = local.common_tags
}

module "sql_server" {
    depends_on = [ module.resource_group ]
  source         = "../../modules/azurerm_sql_server"
  sql_ser_name   = "sql-dev-testapp"
  rg_name        = "rg-dev-testapp"
  location       = "centralindia"
  admin_username = "girijeshadmin"
  admin_password = "Password@321"
  tags           = local.common_tags

}

module "sql_db" {
    depends_on = [ module.sql_server ]
  source      = "../../modules/azurerm_sql_database"
  sql_db_name = "sqldbtestapp"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = local.common_tags
}

module "aks" {
    depends_on = [ module.resource_group ]
  source     = "../../modules/azurerm_kubernetes_cluster"
  aks_name   = "aks-dev-testapp"
  location   = "centralindia"
  rg_name    = "rg-dev-testapp"
  dns_prefix = "aks-dev-testapp"
  tags       = local.common_tags
}