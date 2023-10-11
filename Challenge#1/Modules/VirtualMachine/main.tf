variable "prefix" {
  default = ""
}
resource "azurerm_storage_account" "Storage_VM_BootDiag" {
  name                     = "${var.Storage_VM_BootDiag}"
  resource_group_name      = "${var.rg_name}"
  location                 = "${var.region}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  tags = {
    POC = "${var.Tags}"
  }
}

resource "azurerm_availability_set" "vmavset" {
  name                = "${var.vm_avset}"
  location            = "${var.region}"
  resource_group_name = "${var.rg_name}"
  managed = "true"

  tags = {
    POC = "${var.Tags}"
  }
}
resource "azurerm_network_interface" "VM_NIC" {
  name                = "${var.prefix}-nic"
  location            = "${var.region}"
  resource_group_name = "${var.rg_name}"

  ip_configuration {
    name                          = ""
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    POC = "${var.Tags}"
  }
}

resource "azurerm_windows_virtual_machine" "main" {
  name                  = "${var.Virtual_Machine_Name}"
  location              = "${var.region}"
  resource_group_name   = "${var.rg_name}"
  network_interface_ids = ["${azurerm_network_interface.VM_NIC.id}"]
  size               = "Standard_DS1_v2"
  availability_set_id   = "${azurerm_availability_set.vmavset.id}"
  admin_username = ""
  admin_password = "${var.VM_Password}"
  computer_name  = ""

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
  os_disk  {
    name              = ""
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  boot_diagnostics {
    storage_account_uri= "${azurerm_storage_account.Storage_VM_BootDiag.primary_blob_endpoint}"
  }
  tags = {
    POC = "${var.Tags}"
  }
 depends_on = [azurerm_storage_account.Storage_VM_BootDiag]
}