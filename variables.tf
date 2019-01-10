variable "tfe_org" {
  description = "Name of TFE organization which has workspace containing resource group to use."
}

# Assumes that each workspace tracking resource groups has a unique region
variable "rg_workspace" {
  description = "Name of TFE workspace managing deployment of resource group to use."
}