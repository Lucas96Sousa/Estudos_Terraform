provider "aws" {
  region  = "us-west-1"
  version = "4.19.0"
}

terraform {
  backend  "s3" {
    bucket = "terraformtips"
    key    = "terraform-test.tfstate"
    region = "us-west-1"  
  }
}
