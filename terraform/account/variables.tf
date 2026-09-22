variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ticketing"
}

variable "ecr_force_delete" {
  description = "Force delete ECR repositories (be careful!)"
  type        = bool
  default     = true
}

variable "enable_artifact_bucket" {
  description = "Enable S3 artifact buckets"
  type        = bool
  default     = true
}

variable "artifact_bucket_name" {
  description = "Name of artifact S3 bucket"
  type        = string
  default     = "ticketing-artifacts"
}

variable "logs_bucket_name" {
  description = "Name of logs S3 bucket"
  type        = string
  default     = "ticketing-logs"
}
