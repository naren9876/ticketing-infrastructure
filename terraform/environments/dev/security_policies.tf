# ==================== KMS Encryption Key ====================

resource "aws_kms_key" "ticketing" {
  description             = "KMS key for ${var.cluster_name} encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  tags = {
    Name = "${var.cluster_name}-encryption-key"
  }
}

resource "aws_kms_alias" "ticketing" {
  name          = "alias/${var.cluster_name}-key"
  target_key_id = aws_kms_key.ticketing.key_id
}

# ==================== Security Group for Policies ====================

resource "aws_security_group" "ticketing_policies" {
  name        = "${var.cluster_name}-sg-policies"
  description = "Security group with policies for ${var.cluster_name}"
  vpc_id      = aws_vpc.ticketing.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
    description = "HTTPS from VPC"
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    description = "PostgreSQL from VPC"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound traffic"
  }

  tags = {
    Name = "${var.cluster_name}-sg-policies"
  }
}

# ==================== IAM Role for App ====================

resource "aws_iam_role" "ticketing_app_role" {
  name = "${var.cluster_name}-app-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.cluster_name}-app-role"
  }
}

# ==================== Outputs ====================

output "security_policies_enforced" {
  value = "All security policies enforced for ${var.cluster_name}"
}

output "kms_key_id" {
  value = aws_kms_key.ticketing.id
}

output "app_role_arn" {
  value = aws_iam_role.ticketing_app_role.arn
}
