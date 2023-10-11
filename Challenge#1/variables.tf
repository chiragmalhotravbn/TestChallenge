variable "client_secret" {}
#resource Detail
variable "region" {default = ""}
variable "rg_name" {default = ""}
variable "Tags" {default = ""}
variable "Group_username" {default = ""}
variable "Group_object_id" {default = ""}

#Server Variables
variable "Sql_Password" {}
variable "VM_Password" {}
variable "SQL_Server_Name" {default = ""}
variable "SQL_Database_Name" {default = ""}

#Data Factory Details
variable "DataFactory_Name" {default = ""}

#storage Acount Details
variable "Storage_SQL_Backup_Name" {default = ""}
variable "Storage_ADLS_Backup_Name" {default = ""}

#Logic App Details
variable "Logic_App_Name" {default = ""}

#Automation Account Details
variable "Automation_Account_Name" {default = ""}

#Virtual Machine Detail
variable "Virtual_Machine_Name" {default = ""}
variable "vm_avset" {default = ""}
variable "Storage_VM_BootDiag" {default = ""}