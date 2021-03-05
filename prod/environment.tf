provider "aws" {
  profile = "default" # REPLACE IT FOR OTHER ENV
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    profile        = "default" # REPLACE IT FOR OTHER ENV
    bucket         = "kag-app-prod-terraform" # REPLACE IT FOR OTHER ENV
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "kag-app-prod-terraform"
  }
}

module "demo" {
  source = "../modules/demo"
  bucket_name = "kag-app-prod" # REPLACE IT FOR OTHER ENV
  versioning_status = "false"
}
