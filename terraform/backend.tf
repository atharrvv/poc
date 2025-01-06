terraform {
  backend "azurerm" {
    resource_group_name  = "tera-backend"
    storage_account_name = "terabackendbackup"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
