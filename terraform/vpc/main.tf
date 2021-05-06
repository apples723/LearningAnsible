provider "aws" {
  region              = "us-west-1"
  assume_role {
    role_arn = "arn:aws:iam::376426587433:role/ITInfrastructure-Team-Sandbox"
  }
}
terraform {
  backend "s3" {
    bucket = "2u-terraform"
    region = "us-east-1"
    key    = "it/sandbox/ansible/vpc.tfstate"
  }
}
