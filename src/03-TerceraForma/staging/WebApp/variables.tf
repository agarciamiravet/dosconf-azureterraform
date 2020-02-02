variable "key_vault_name" {
    type = string
}

variable "key_vault_resource_group" {
    type = string
}

variable "key_vault_secret_resourcegroup" {
    type = string
}

variable "key_vault_secret_certificate_password" {
    type = string
}

variable "key_vault_secret_certificate_base64" {
    type = string
}

variable "key_vault_secret_certificate_thumbprint" {
    type = string
    description = "description"
}

variable "key_vault_secret_sql_connectionstring" {
    type = string
}


variable "complete_url_site" {
    type = string
}

variable "dns_simple_domain" {
    type = string
}

variable "dns_simple_cname_record_name" {
    type = string
}

variable "location" {
  type = string
}

variable "serviceplan_sku_tier" {
    type = string
    description = "Service Plan Sku Tier"
}

variable "serviceplan_sku_size" {
    type = string
    description = "Service Plan Sku Size"
}

variable "tags" {
  type        = map
  description = "Default tags for all resources"

  default = {
    Created_Modified_By = "terraform",
    Environment = "staging",
    Version = "0.0.1"
  }
}

variable "webapp_enablehttps" {
    type = bool
    description = "if web app use only https"
}

variable "webapp_url_site" {
    type = string
    description = "Url of new web app"
}


variable "url_site" {
    type = string
}

variable "app_service_plan_name" {
    type = string
    description = "Name of App Service Plan"
}