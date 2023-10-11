
module "SqlServer" {
source      = "./Modules/SqlServer"
SQL_Server_Name = "${var.SQL_Server_Name}"
Storage_SQL_Backup_Name = "${var.Storage_SQL_Backup_Name}"
region = "${var.region}" 
rg_name = "${var.rg_name}"
Tags = "${var.Tags}"
Sql_Password = "${var.Sql_Password}"
Group_username = "${var.Group_username}"
Group_object_id = "${var.Group_object_id}"
SQL_Database_Name = "${var.SQL_Database_Name}"
subnet_id = "${data.azurerm_subnet.internal.id}"
workspace_id = "${data.azurerm_log_analytics_workspace.log_analytics.id}"
}

module "DataFactory" {
source      = "./Modules/DataFactory"
DataFactory_Name = "${var.DataFactory_Name}"
region = "${var.region}" 
rg_name = "${var.rg_name}"
Tags = "${var.Tags}"
workspace_id = "${data.azurerm_log_analytics_workspace.log_analytics.id}"
}

module "ADLSStorageAccount" {
source = "./Modules/ADLSStorageAccount"
Storage_ADLS_Backup_Name = "${var.Storage_ADLS_Backup_Name}"
region = "${var.region}" 
rg_name = "${var.rg_name}"
Tags = "${var.Tags}"  
subnet_id = "${data.azurerm_subnet.internal.id}"
}

module "Logic_App_Name" {
source = "./modules/LogicApp"
Logic_App_Name = "${var.Logic_App_Name}"
region = "${var.region}" 
rg_name = "${var.rg_name}"
Tags = "${var.Tags}" 
workspace_id = "${data.azurerm_log_analytics_workspace.log_analytics.id}"
}

module "AutomationAccount" {
source = "./Modules/AutomationAccount"
Automation_Account_Name = "${var.Automation_Account_Name}"
region = "${var.region}" 
rg_name = "${var.rg_name}"
Tags = "${var.Tags}" 
workspace_id = "${data.azurerm_log_analytics_workspace.log_analytics.id}"
}

module "VirtualMachine" {
  source = "./Modules/VirtualMachine"
  Virtual_Machine_Name = "${var.Virtual_Machine_Name}"
  region = "${var.region}" 
  rg_name = "${var.rg_name}"
  Tags = "${var.Tags}"
  subnet_id  = "${data.azurerm_subnet.internal.id}"
  vm_avset = "${var.vm_avset}"
  Storage_VM_BootDiag = "${var.Storage_VM_BootDiag}"
  VM_Password = "${var.VM_Password}"
}