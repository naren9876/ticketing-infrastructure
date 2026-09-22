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
    tags = merge(
      var.tags,
      {
        Project     = var.project_name
        Environment = var.environment
        ManagedBy   = "terraform"
        CreatedAt   = timestamp()
      }
    )
  }
}

# ==================== Outputs ====================

output "aws_region" {
  value       = var.aws_region
  description = "AWS region"
}

output "environment" {
  value       = var.environment
  description = "Environment name"
}

output "cluster_name" {
  value       = var.cluster_name
  description = "EKS cluster name"
}

output "project_name" {
  value       = var.project_name
  description = "Project name"
}
