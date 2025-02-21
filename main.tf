
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0.1"
    }
  }
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

provider "github" {
	token = var.github_token
	owner="MoNKy0112"
}


resource "github_repository" "repository_auto_init" {
  name        = "RepoTics"
  description = "Repositorio ArquiTics2024"
  auto_init   = true
  visibility  = "public"

  template {
	owner                = "github"
	repository = "codespaces-react"
  }
}

resource "github_branch" "branch_development" {
  repository = github_repository.repository_auto_init.name
  branch     = "development"
}

resource "github_branch" "branch_qa" {
  repository = github_repository.repository_auto_init.name
  branch     = "qa"
}

resource "github_branch" "branch_production" {
  repository = github_repository.repository_auto_init.name
  branch     = "production"
}