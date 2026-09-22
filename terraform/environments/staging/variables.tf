variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "ticketing"
}

variable "node_groups" {
  type = map(object({
    name           = string
    instance_types = list(string)
    desired_size   = number
    min_size       = number
    max_size       = number
  }))
  description = "Node group configuration"
}

variable "rds_config" {
  type = object({
    engine_version               = string
    instance_class               = string
    allocated_storage             = number
    backup_retention_days        = number
    multi_az                     = bool
    enabled_cloudwatch_logs_exports = list(string)
    deletion_protection          = optional(bool, false)
  })
  description = "RDS configuration"
}

variable "s3_buckets" {
  type        = map(string)
  description = "S3 bucket names"
}

variable "eks_version" {
  type        = string
  description = "EKS cluster version"
  default     = "1.36"
}

variable "ecr_force_delete" {
  type        = bool
  description = "Force delete ECR repos"
  default     = false
}

variable "min_capacity" {
  type        = number
  description = "Minimum capacity (deprecated - use node_groups)"
  default     = 2
}

variable "single_nat_gateway" {
  type        = bool
  description = "Use single NAT gateway"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
  default = {
    ManagedBy = "Terraform"
    Project   = "ticketing"
  }
}
