# Account-level Terraform (shared across all environments)
# Manages: ECR, S3, KMS, IAM policies
# State: s3://bucket/account/terraform.tfstate

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Layer       = "account"
      ManagedBy   = "terraform"
      Project     = "ticketing"
      CreatedAt   = "2026-09-21"
    }
  }
}

output "aws_region" {
  value = var.aws_region
}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}
