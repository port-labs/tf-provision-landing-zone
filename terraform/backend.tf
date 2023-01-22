provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "port-lz-provisioner-tf-state"
    region         = "eu-west-1"
    dynamodb_table = "port-lz-provisioner-tf-state-lock-dynamo"
    key            = "terraform-state/terraform.tfstate"
  }
}
