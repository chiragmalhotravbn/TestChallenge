data "azurerm_subnet" "internal" {
  name                 = ""
  virtual_network_name = ""
  resource_group_name  = "${var.rg_name}"
}
data "azurerm_log_analytics_workspace" "log_analytics" {
  name                = ""
  resource_group_name = ""
}