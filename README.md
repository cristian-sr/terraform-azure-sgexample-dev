# terraform-azure-sgexample

Simple example showing a deployment of Azure Security Groups, with variables and outputs.

It also shows how to retrieve output from external workspace hosted by Terraform Enterprise. 
If you are running this code from your local machine, you will need to set the environment variable ATLAS_TOKEN, with a user token from Terraform Enterprise.

## Azure authentication
For complete information on the options available, check: https://www.terraform.io/docs/providers/azurerm#authenticating-to-azure

Or you can simply set the following environment variables:
```
$ export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
$ export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
$ export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
$ export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
```

## Azure Workflow Example
This repository is meant to be can be part of a larger Azure workflow using Terraform Enterprise example: LINK 

If you want to use it by itself, it will fail when not finding expected resource group. 
This can be fixed by update the code:

```
resource "azurerm_resource_group" "rg" {
  name     = "dev-rg"
  location = "US Central"
}

resource "azurerm_network_security_group" "dev-sg" {
  name                = "DevSecurityGroup"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  ...
```