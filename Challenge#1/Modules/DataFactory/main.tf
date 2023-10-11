data "azurerm_client_config" "current" {}
resource "azurerm_data_factory" "Azure_datafactory" {
  name                = "${var.DataFactory_Name}"
  location            = "${var.region}"
  resource_group_name = "${var.rg_name}"
  tags = {
      POC = "${var.Tags}"
  }

}
