output "application_group" {
  value = "${var.environment}"
}

output "environment" {
  value = "${var.account}"
}

output "region" {
  value = "${var.owner}"
}

output "account" {
  value = "${data.aws_iam_account_alias.current.account_alias}"
}

output "costcenter" {
  value = "${var.costcenter}"
}