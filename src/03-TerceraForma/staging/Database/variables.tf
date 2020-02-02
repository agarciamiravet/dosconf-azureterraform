variable "database_name" {
    type = string
    description = "Database Name"
}

variable "database_server_name" {
    type = string
    description = "database server name"
}

variable "key_vault_resource_group" {
  type = string
  description = "Name resource group key vault"
}

variable "key_vault_name" {
    type = string
}

variable "key_vault_secret_resourcegroup" {
    type = string
}

variable "key_vault_secret_sqluser" {
    type = string
}

variable "key_vault_secret_sqlpassword" {
    type = string
}

variable "location" {
    type = string
    default = "West Europe"
    description = "Location where to create resources"
}

variable "sqlserver_edition"{
    type = string
    default = "Standard"
}

variable "tags" {
  type        = map
  description = "Default tags for all resources"

  default = {
    Created_Modified_By = "terraform",
    Environment = "Staging",
    Version = "0.0.1"
  }
}