
#create storage account for ADLS
resource "azurerm_storage_account" "Storage_ADLS_Backup" {
  name                     = "${var.Storage_ADLS_Backup_Name}"
  resource_group_name      = "${var.rg_name}"
  location                 = "${var.region}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  account_kind = "StorageV2"
  is_hns_enabled = "true"
  tags = {
    POC = "${var.Tags}"
  }
}