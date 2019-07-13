output "application_group" {
  value = "${var.environment}"
}

output "environment" {
  value = "${var.account}"
}

output "region" {
  value = "${var.business_owner}"
}

output "account" {
  value = "${var.application_group}"
}