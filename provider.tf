provider "aws" {
  region = var.region
  default_tags {
    tags = {
    Environment = var.environment
    Solution = var.solution
    }
  }
}
terraform {
  backend "s3" {
    key            = "eks-backup/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "sai-us-east-1-ec2"
    encrypt        = true

  }
}


 