terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  subscription_id = ""
  client_id       = ""
  client_secret   = "${var.client_secret}"
  tenant_id       = ""
  skip_provider_registration = "true"
  features {}
}