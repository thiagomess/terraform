terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "thiagomess"

    workspaces {
      name = "aws"
    }
  }
}
