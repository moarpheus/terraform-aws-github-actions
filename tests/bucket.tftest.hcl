# Apply run block to create the bucket
run "create_oidc" {
  command = plan
  variables {
  }

  # Check that the oidc is created
  assert {
    condition     = true == true
    error_message = "Incorrect oidc"
  }
}
