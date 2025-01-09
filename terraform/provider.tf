provider "azurerm" {
  subscription_id = ${{ secrets.SUBSCRIPTION_ID }}
  client_id       = ${{ secrets.CLIENT_ID }}
  client_secret   = ${{ secrets.CLIENT_SECRET }}
  tenant_id       = ${{ secrets.TENANT_ID }}
  features {}
}
