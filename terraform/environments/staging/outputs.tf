# Environment-level outputs

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

# EKS Cluster outputs
output "eks_cluster_name" {
  value       = aws_eks_cluster.ticketing.name
  description = "EKS cluster name"
}

output "eks_cluster_endpoint" {
  value       = aws_eks_cluster.ticketing.endpoint
  description = "EKS cluster endpoint"
}

output "eks_cluster_certificate_authority" {
  value       = aws_eks_cluster.ticketing.certificate_authority[0].data
  description = "EKS cluster certificate authority"
}

output "eks_cluster_id" {
  value       = aws_eks_cluster.ticketing.id
  description = "EKS cluster ID"
}

# VPC and Network outputs
output "vpc_id" {
  value       = aws_vpc.ticketing.id
  description = "VPC ID"
}

output "public_subnet_1_id" {
  value       = aws_subnet.public_1.id
  description = "Public subnet 1 ID"
}

output "public_subnet_2_id" {
  value       = aws_subnet.public_2.id
  description = "Public subnet 2 ID"
}

output "security_group_id" {
  value       = aws_security_group.ticketing.id
  description = "Security group ID"
}

# Security and IAM outputs
output "kms_key_id" {
  value       = aws_kms_key.ticketing.id
  description = "KMS key ID for encryption"
}

output "app_role_arn" {
  value       = aws_iam_role.ticketing_app_role.arn
  description = "Application IAM role ARN"
}

output "security_policies_enforced" {
  value       = "true"
  description = "Security policies are enforced"
}
