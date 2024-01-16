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

variable "github_repos" {
  type        = map(string)
  description = "List of Github repos and corresponding branches that role is expected to be used with"
}

variable "github_actions_role_name" {
  type    = string
  default = "github_actions_automation"
}
