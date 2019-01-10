# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.20.0"
}

data "terraform_remote_state" "resource_groups" {
  backend = "atlas"
  config {
    name = "${var.tfe_org}/${var.rg_workspace}"
  }
}
resource "azurerm_network_security_group" "dev-sg" {
  name                = "DevSecurityGroup"
  location            = "${data.terraform_remote_state.resource_groups.location}"
  resource_group_name = "${var.resource_group_name}"

    security_rule {
    name                       = "MySQL"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags {
    environment = "dev"
  }
}