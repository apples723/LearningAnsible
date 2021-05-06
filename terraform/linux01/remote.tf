data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "2u-terraform"
    key    = "it/sandbox/ansible/vpc.tfstate"
    region = "us-east-1"
  }
}
