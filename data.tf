data "azurerm_key_vault" "keyvault_devops" {
 name                = "atharv"
 resource_group_name = "dhanush_group"
}

data "azurerm_key_vault_secrets" "azure_key_vault" {
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault_secret" "example" {
  for_each     = toset(data.azurerm_key_vault_secrets.example.names)
  name         = each.key
  key_vault_id = data.azurerm_key_vault.existing.id
}
