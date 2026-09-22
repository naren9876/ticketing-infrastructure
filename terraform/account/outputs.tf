# Account-level outputs (referenced by environments)

output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "AWS Account ID"
}

output "region" {
  value       = var.aws_region
  description = "AWS Region"
}

# ECR outputs for environments to reference
output "ecr_registry_url" {
  value       = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com"
  description = "ECR registry URL"
}

output "ecr_api_gateway_url" {
  value       = aws_ecr_repository.api_gateway.repository_url
  description = "API Gateway ECR URL"
}

output "ecr_user_service_url" {
  value       = aws_ecr_repository.user_service.repository_url
  description = "User Service ECR URL"
}

output "ecr_movie_service_url" {
  value       = aws_ecr_repository.movie_service.repository_url
  description = "Movie Service ECR URL"
}

output "ecr_booking_service_url" {
  value       = aws_ecr_repository.booking_service.repository_url
  description = "Booking Service ECR URL"
}

output "ecr_payment_service_url" {
  value       = aws_ecr_repository.payment_service.repository_url
  description = "Payment Service ECR URL"
}

output "ecr_notification_service_url" {
  value       = aws_ecr_repository.notification_service.repository_url
  description = "Notification Service ECR URL"
}
