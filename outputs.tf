output "security_group_id" {
  value = "${azurerm_network_security_group.dev-sg.id}"
}

output "location" {
  value = "${data.terraform_remote_state.resource_groups.location}"
}

output "resource_group_name" {
  value = "${var.resource_group_name}"
}
