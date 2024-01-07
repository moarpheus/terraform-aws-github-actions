resource "aws_iam_openid_connect_provider" "github_oidc" {
  tags   = var.tags
}