locals {
  repos_list = [for repo, branch in var.github_repos : "repo:${repo}:ref:refs/heads/${branch}"]
}
