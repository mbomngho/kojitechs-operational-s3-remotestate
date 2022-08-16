

terraform {
  required_version = ">=1.0.0"
  backend "s3" {
    bucket         = "statefile.bucket.lionel"
    dynamodb_table = "terraform-state-lock"
    region         = "us-east-1"
    key            = "path/env"
    encrypt        = true
  }
  #required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

