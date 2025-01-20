resource "azurerm_mysql_flexible_server" "server" {
  name                   = "john"
  resource_group_name    = azurerm_resource_group.resource_group.name
  location               = azurerm_resource_group.resource_group.location
  administrator_login    = "john"
  administrator_password = "john@123"
  sku_name               = "B_Standard_B2ms"
}

resource "azurerm_mysql_flexible_database" "database" {
  name                = "john-wick"
  resource_group_name = azurerm_resource_group.resource_group.name
  server_name         = azurerm_mysql_flexible_server.server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}


resource "azurerm_mysql_flexible_server_firewall_rule" "rule" {
  name                = "office"
  resource_group_name = azurerm_resource_group.resource_group.name
  server_name         = azurerm_mysql_flexible_server.server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
