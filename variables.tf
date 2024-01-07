variable "url" {
  description = "The URL of the identity provider"
  type        = string
  default     = "https://token.actions.githubusercontent.com"
}

variable "client_id_list" {
  description = "A list of client IDs"
  type        = list(string)
}

variable "thumbprint_list" {
  description = "A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s)."
  type        = list(string)
  validation {
    condition = alltrue([
      for n in var.thumbprint_list :
      (length(n) > 39)
    ])
    error_message = "Thumbprint length must be greater or equal to 40"
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}
