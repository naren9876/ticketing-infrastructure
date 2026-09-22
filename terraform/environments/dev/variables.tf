# ==================== Basic Variables ====================

variable "environment" {
  description = "Environment name (dev, staging, production)"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ticketing"
}

# ==================== Node Groups Configuration ====================

variable "node_groups" {
  description = "EKS node groups configuration"
  type = map(object({
    name           = string
    instance_types = list(string)
    desired_size   = number
    min_size       = number
    max_size       = number
  }))
  default = {}
}

# ==================== Database Configuration ====================

variable "rds_config" {
  description = "RDS database configuration"
  type = object({
    engine_version                   = string
    instance_class                   = string
    allocated_storage                = number
    backup_retention_days            = number
    multi_az                         = bool
    enabled_cloudwatch_logs_exports  = list(string)
    deletion_protection              = optional(bool, false)
  })
  default = {
    engine_version                   = "14.7"
    instance_class                   = "db.t3.micro"
    allocated_storage                = 20
    backup_retention_days            = 7
    multi_az                         = false
    enabled_cloudwatch_logs_exports  = ["postgresql"]
    deletion_protection              = false
  }
}

# ==================== Storage Configuration ====================

variable "s3_buckets" {
  description = "S3 buckets configuration"
  type = map(string)
  default = {
    artifacts = "ticketing-artifacts"
    logs      = "ticketing-logs"
  }
}

# ==================== Tags ====================

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}
