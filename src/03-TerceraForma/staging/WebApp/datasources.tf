data "azurerm_key_vault" "key_vault_dosconf2010" {
  name                =  var.key_vault_name
  resource_group_name = var.key_vault_resource_group
}

data "azurerm_key_vault_secret" "resource_group_secret" {
  name         =  var.key_vault_secret_resourcegroup
  key_vault_id = data.azurerm_key_vault.key_vault_dosconf2010.id
}

data "azurerm_key_vault_secret" "web_certificate_password" {
  name         =  var.key_vault_secret_certificate_password
  key_vault_id = data.azurerm_key_vault.key_vault_dosconf2010.id
}

data "azurerm_key_vault_secret" "web_certificate_base64" {
  name         = var.key_vault_secret_certificate_base64
  key_vault_id = data.azurerm_key_vault.key_vault_dosconf2010.id
}

data "azurerm_key_vault_secret" "web_certificate_thumbprint" {
  name         = var.key_vault_secret_certificate_thumbprint
  key_vault_id = data.azurerm_key_vault.key_vault_dosconf2010.id
}

data "azurerm_key_vault_secret" "database_connstring_secret" {
  name         = var.key_vault_secret_sql_connectionstring
  key_vault_id = data.azurerm_key_vault.key_vault_dosconf2010.id
}