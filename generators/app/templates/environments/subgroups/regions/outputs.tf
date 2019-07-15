output "region" {
  value = "${var.region}"
}
<% for (i in components) { %>
output "module-output-value" {
  value = "${module.<%= components[i] %>.module-output-value}"
}
<% } %>