aws_region   = "us-east-1"
environment  = "staging"
cluster_name = "ticketing-staging"
project_name = "ticketing"
eks_version  = "1.36"

# Node groups
node_groups = {
  compute = {
    name           = "compute"
    instance_types = ["t3.small"]
    desired_size   = 2
    min_size       = 2
    max_size       = 3
  }
}

# RDS configuration
rds_config = {
  engine_version                   = "14.7"
  instance_class                   = "db.t3.small"
  allocated_storage                = 50
  backup_retention_days            = 30
  multi_az                         = true
  enabled_cloudwatch_logs_exports  = ["postgresql"]
  deletion_protection              = false
}

# S3 buckets
s3_buckets = {
  artifacts = "ticketing-staging-artifacts"
  logs      = "ticketing-staging-logs"
}

ecr_force_delete = false
