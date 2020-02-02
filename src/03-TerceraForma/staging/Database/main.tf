terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "stdosconftfbackend"
    container_name       = "terraform-backend"
    key                  = "terraform-multifolder-db.tfstate"
  }
}

provider "azurerm" {
  
  version = "=1.42.0"
}

resource "azurerm_key_vault_secret" "sql_connection_string_secret" {
  name         =  "staging-pasionporlosbits-connectionstring"
  value        =  module.database.sql_connectionstring
  key_vault_id =  data.azurerm_key_vault.key_vault_dosconf2010.id
}

module "database" {
  source = "github.com/recetasdevops/dosconf2020-terraform-database-module.git?ref=v2.0"

  database_name = var.database_name
  database_server_name = var.database_server_name
  location  = var.location
  resource_group = data.azurerm_key_vault_secret.key_vault_secret_resourcegroup.value
  sqlserver_edition = var.sqlserver_edition
  sqlserver_user = data.azurerm_key_vault_secret.key_vault_secret_sqluser.value
  sqlserver_pass  =  data.azurerm_key_vault_secret.key_vault_secret_sqlpassword.value
  tags = var.tags
}