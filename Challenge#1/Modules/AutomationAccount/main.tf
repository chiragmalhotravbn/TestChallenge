resource "azurerm_automation_account" "Automation_Account" {
  name                = "${var.Automation_Account_Name}"
  location            = "${var.region}"
  resource_group_name = "${var.rg_name}"
  sku_name = "Basic"

  tags = {
    POC = "${var.Tags}"
  }
}