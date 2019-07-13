## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| account |  | string | n/a | yes |
| application\_group |  | string | n/a | yes |
| business\_owner |  | string | n/a | yes |
| component |  | string | n/a | yes |
| environment |  | string | n/a | yes |
| region |  | string | n/a | yes |

## Generate README for each module with input and output variables

You needn't manually manage `USAGE` about input variables and outputs. [terraform-docs](https://github.com/segmentio/terraform-docs) can do this job automatically.

```
$ brew install terraform-docs
$ cd terraform/modules/vpc
$ terraform-docs md . > README.md
```

For details on how to run `terraform-docs`, check this repository: https://github.com/segmentio/terraform-docs

There is a simple sample for you to start [tf_aws_acme](https://github.com/BWITS/tf_aws_acme), the README is generatd by `terraform-docs`
