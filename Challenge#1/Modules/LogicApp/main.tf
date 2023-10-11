resource "azurerm_logic_app_workflow" "Logic_App" {
  name                = "${var.Logic_App_Name}"
  location            = "${var.region}"
  resource_group_name = "${var.rg_name}"
  tags = {
      POC = "${var.Tags}"
  }
}