aws_region            = "us-east-1"
environment           = "staging"
project_name          = "ticketing"
cluster_name          = "ticketing-staging"
eks_version           = "1.36"
desired_capacity      = 3
min_capacity          = 2
max_capacity          = 4
instance_type         = "t3.medium"
db_allocated_storage  = 50
db_engine_version     = "14.7"
db_instance_class     = "db.t3.small"
db_name               = "ticketing_db"
enable_nat_gateway    = true
single_nat_gateway    = false

tags = {
  Environment = "staging"
  ManagedBy   = "Terraform"
  Project     = "TicketingApp"
  CreatedAt   = "2026-09-19"
}
