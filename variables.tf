variable "url" {
  description = "The URL of the identity provider"
  type        = string
  default     = "https://token.actions.githubusercontent.com"
}

variable "client_id_list" {
  description = "A list of client IDs"
  type        = list(string)
  default     = ["sts.amazonaws.com"]
}

variable "tags" {
  type    = map(string)
  default = {}
}
