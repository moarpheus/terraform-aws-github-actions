# Apply run block to create OIDC
run "create_oidc" {
  variables {
    url = "https://test.mystuff.com"
    client_id_list = [
      "sts.amazonaws.com",
    ]

    thumbprint_list = ["1111111111111111111111111111111111111111111111",]
  }

  # Check that the OIDC is created with correct suffix
  assert {
    condition     = split("/", aws_iam_openid_connect_provider.github_oidc.arn)[1] == "test.mystuff.com"
    error_message = "Incorrect oidc arn"
  }
}
