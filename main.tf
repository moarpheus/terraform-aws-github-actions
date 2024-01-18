resource "aws_iam_openid_connect_provider" "github_oidc" {
  tags            = var.tags
  client_id_list  = var.client_id_list
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]
  url             = var.url
}
