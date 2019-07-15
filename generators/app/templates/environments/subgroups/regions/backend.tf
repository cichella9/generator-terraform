# The attribute `${data.aws_caller_identity.current.account_id}` will be current account number. 
data "aws_caller_identity" "current" {}

# The attribue `${data.aws_iam_account_alias.current.account_alias}` will be current account alias
data "aws_iam_account_alias" "current" {}

# The attribute `${data.aws_region.current.name}` will be current region
data "aws_region" "current" {}

# Set as [local values](https://www.terraform.io/docs/configuration/locals.html)
locals {
  account_id    = data.aws_caller_identity.current.account_id
  account_alias = data.aws_iam_account_alias.current.account_alias
  region        = data.aws_region.current.name
}

<% if (backend == "s3") { %>
provider "<%= provider %>" {
  # provider parameters here. Override any secrets at run time and avoid storing them in source control
  version = "~> <%= providerVersion %>"
  region  = "${ var.region }"

  assume_role {
    role_arn = "<%= backendRoleArn %>"
  }
}

terraform {
    backend "<%= backend %>" {
        bucket   = "<%= backendBucketName %>"
        key      = "<%= backendBucketKeyPrefix %>/<%= environment %>/<%= region %>/terraform.tfstate"
        region   = "<%= backendBucketRegion %>"
        role_arn = "<%= backendRoleArn %>"
        dynamodb_table = "<%= backendDynamoDBtableName %>" 
        encrypt = "<%= backendEncrypt %>" 
    }
}

data "terraform_remote_state" "vars" {
    backend = "<%= backend %>"
    config {
        bucket   = "<%= backendBucketName %>"
        key      = "<%= backendBucketKeyPrefix %>/<%= environment %>/<%= region %>/vars.tfstate"
        region   = "<%= backendBucketRegion %>"
        role_arn = "<%= backendRoleArn %>"
        dynamodb_table = "terraform-state-lock-dynamo-table"
        encrypt = true
    }
}
<% } %>
<% if (backend == "local") { %>
provider "<%= provider %>" {
  # provider parameters here.
  version = "~> <%= providerVersion %>"
  region  = "${ var.region }"

  # Local using aws credentials profile
  profile = "default"

  # Override any secrets at run time and avoid storing them in source control
  # access_key = ""
  # secret_key = ""
}

terraform {
  backend "local" {
    path = "<%= backendLocalPathPrefix %>"
  }
}
<% } %>
