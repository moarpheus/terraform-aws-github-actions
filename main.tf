resource "aws_iam_openid_connect_provider" "github_oidc" {
  tags            = var.tags
  client_id_list  = var.client_id_list
  thumbprint_list = var.thumbprint_list
  url             = var.url
}
