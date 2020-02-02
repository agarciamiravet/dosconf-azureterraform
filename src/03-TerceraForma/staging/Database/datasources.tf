data "azurerm_key_vault" "key_vault_dosconf2010" {
  name                =  var.key_vault_name
  resource_group_name = var.key_vault_resource_group
}

data "azurerm_key_vault_secret" "key_vault_secret_sqluser" {
  name         =  var.key_vault_secret_sqluser
  key_vault_id = data.azurerm_key_vault.key_vault_dosconf2010.id
}

data "azurerm_key_vault_secret" "key_vault_secret_sqlpassword" {
  name         = var.key_vault_secret_sqlpassword
  key_vault_id = data.azurerm_key_vault.key_vault_dosconf2010.id
}


data "azurerm_key_vault_secret" "key_vault_secret_resourcegroup" {
  name         = var.key_vault_secret_resourcegroup
  key_vault_id = data.azurerm_key_vault.key_vault_dosconf2010.id
}