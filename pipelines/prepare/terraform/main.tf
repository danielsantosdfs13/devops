provider "aws" {
  version = ">= 2.28.1"
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "devops-tf-remote-state-aws"
    key    = "terraform/devops_state"
    region = "us-east-1"
  }
}