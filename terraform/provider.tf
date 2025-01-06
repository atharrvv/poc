provider "azurerm" {
  subscription_id = SUBSCRIPTION_ID
  client_id       = CLIENT_ID
  client_secret   = CLIENT_SECRET
  tenant_id       = TENANT_ID
  features {}
}
