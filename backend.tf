terraform {
  backend "s3" {
    bucket = "terraform-test-bucket-55598"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "test"
  }
}
