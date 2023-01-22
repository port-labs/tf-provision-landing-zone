provider "aws" {
  alias  = "west"
  region = "eu-west-1"
}

# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage" {
  provider = aws.west
  bucket   = "port-lz-provisioner-tf-state"
}

resource "aws_s3_bucket_versioning" "terraform-state-versioning" {
  bucket = aws_s3_bucket.terraform-state-storage.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "port-lz-provisioner-tf-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

}
