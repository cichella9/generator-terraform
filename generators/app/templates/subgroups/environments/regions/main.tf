<% for (i in components) { %>
module "<%= components[i] %>" {
    source            = "../../../modules/<%= components[i] %>"
    # other variables to be passed in go here
    environment       = "${data.terraform_remote_state.vars.environment}"
    account           = "${data.terraform_remote_state.vars.account}"
    business_owner    = "${data.terraform_remote_state.vars.business_owner}"
    application_group = "${data.terraform_remote_state.vars.application_group}"
    region            = "${var.region}"
}
<% } %>

