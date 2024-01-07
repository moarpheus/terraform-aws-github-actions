variable "url" {
  description = "The URL of the identity provider"
  type        = string
}

variable "client_id_list" {
  description = "A list of client IDs"
  type        = list(string)
}

variable "thumbprint_list" {
  description = "A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s)."
  type        = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}
