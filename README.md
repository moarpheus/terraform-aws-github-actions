# Terraform module to enable github actions integration with AWS account

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.29.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github_oidc](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.github_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.github_role](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.github_role_policy_attachement](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role_github_actions](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.github_actions_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.github](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id_list"></a> [client\_id\_list](#input\_client\_id\_list) | A list of client IDs | `list(string)` | <pre>[<br>  "sts.amazonaws.com"<br>]</pre> | no |
| <a name="input_github_actions_role_name"></a> [github\_actions\_role\_name](#input\_github\_actions\_role\_name) | n/a | `string` | `"github_actions_automation"` | no |
| <a name="input_github_repo"></a> [github\_repo](#input\_github\_repo) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_url"></a> [url](#input\_url) | The URL of the identity provider | `string` | `"https://token.actions.githubusercontent.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_arn"></a> [oidc\_arn](#output\_oidc\_arn) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
