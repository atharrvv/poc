resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "acr" {
  name                = "billgates"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku                 = "Standard"
  admin_enabled       = false
}

data "azurerm_subscription" "sub" {}


resource "azurerm_role_assignment" "role_owner" {
  scope                = data.azurerm_subscription.sub.id
  role_definition_name = "Owner"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
