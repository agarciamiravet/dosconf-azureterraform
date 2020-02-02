#terraform {
 # backend "remote" {
  #  organization = "recetasdevops"

   # workspaces {
    #  name = "charlamadriddotnet-db"
    #}
  #}
#}

provider "azurerm" {

  version = "=1.35.0"
}

provider "dnsimple" {
  token = "4GuUof3bC5pbxaI3iuht7gBE3jpcXpxK"
  account = "84578"
  version = "=0.2.0"
}

resource "azurerm_resource_group" "CharlaResourceGroup" {
  name     = "madriddotnet-rg"
  location =  "West Europe"
}

module "database" {
  source = "./Database"

  database_name = var.database_name
  database_server_name = var.database_server_name
  location  = var.location
  resource_group = azurerm_resource_group.CharlaResourceGroup.name
  sqlserver_edition = var.sqlserver_edition
  sqlserver_user = var.sqlserver_user
  sqlserver_pass  =  var.sqlserver_pass
  tags = var.tags
}

module "webapp" {
  source = "./WebApp"

  cert_pfx_password = var.cert_pfx_password
  cert_pfx_base64 = var.cert_pfx_base64
  dns_simple_domain = var.dns_simple_domain
  location  = var.location
  resource_group = azurerm_resource_group.CharlaResourceGroup.name
  tags = var.tags
  webapp_url_site = var.webapp_url_site
  url_site = var.url_site
  serviceplan_sku_size = var.serviceplan_sku_size
  serviceplan_sku_tier = var.serviceplan_sku_tier
  webapp_enablehttps = var.webapp_enablehttps
  cert_thumbprint = var.cert_thumbprint
}