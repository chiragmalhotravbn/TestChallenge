
data "azurerm_client_config" "current" {}
resource "azurerm_storage_account" "Storage_SQL_Backup" {
  name                     = "${var.Storage_SQL_Backup_Name}"
  resource_group_name      = "${var.rg_name}"
  location                 = "${var.region}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  account_kind = "StorageV2"
  tags = {
    POC = "${var.Tags}"
  }
}
resource "azurerm_storage_container" "Storage_SQL_Backup" {
  name                  = ""
  storage_account_name  = "${azurerm_storage_account.Storage_SQL_Backup.name}"
  container_access_type = "private"
    depends_on = [azurerm_storage_account.Storage_SQL_Backup]
}
#Create SQL Server
resource "azurerm_mssql_server" "mssqlsrv" {
  name                         = "${var.SQL_Server_Name}"
  resource_group_name          = "${var.rg_name}"
  location                     = "${var.region}"
  version                      = "12.0"
  administrator_login          = ""
  administrator_login_password = "${var.Sql_Password}"
  azuread_administrator {
    login_username      = "${var.Group_username}"
    object_id           = "${var.Group_object_id}"
  }
  tags = {
    POC = "${var.Tags}"
  }
  depends_on = [azurerm_storage_container.Storage_SQL_Backup]
}
#Create SQL Database
resource "azurerm_mssql_database" "mssqldb" {
  name                = "${var.SQL_Database_Name}"
  server_id         = "${azurerm_mssql_server.mssqlsrv.id}"
  tags = {
    POC = "${var.Tags}"
  }
}
#Enable Allow Azure Resources to access SQL
resource "azurerm_mssql_firewall_rule" "sqlfirewall" {
  name                = "FirewallRule1"
  server_id         = "${azurerm_mssql_server.mssqlsrv.id}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
  depends_on = [azurerm_mssql_database.mssqldb]
}

#Apply VNet in Firewall
resource "azurerm_mssql_virtual_network_rule" "sqlvnetrule" {
  name                = "sql-vnet-rule"
  server_id         = "${azurerm_mssql_server.mssqlsrv.id}"
  subnet_id           = "${var.subnet_id}"
  depends_on = [azurerm_storage_account.Storage_SQL_Backup]
}