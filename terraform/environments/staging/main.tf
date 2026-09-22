# Staging environment Terraform configuration

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
      Layer       = "environment"
      Environment = var.environment
      Cluster     = var.cluster_name
      ManagedBy   = "terraform"
      Project     = var.project_name
    }
  }
}
