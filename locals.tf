locals {
  repos_list = [for name, branch in var.github_repos : "repo:user/${name}:ref:refs/heads/${branch}"]
}
