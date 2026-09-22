# Account-level ECR repositories (shared across all environments)

resource "aws_ecr_repository" "api_gateway" {
  name                   = "ticketing-api-gateway"
  image_tag_mutability   = "MUTABLE"
  force_delete           = var.ecr_force_delete

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Service = "api-gateway"
  }
}

resource "aws_ecr_repository" "user_service" {
  name                   = "ticketing-user-service"
  image_tag_mutability   = "MUTABLE"
  force_delete           = var.ecr_force_delete

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Service = "user-service"
  }
}

resource "aws_ecr_repository" "movie_service" {
  name                   = "ticketing-movie-service"
  image_tag_mutability   = "MUTABLE"
  force_delete           = var.ecr_force_delete

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Service = "movie-service"
  }
}

resource "aws_ecr_repository" "booking_service" {
  name                   = "ticketing-booking-service"
  image_tag_mutability   = "MUTABLE"
  force_delete           = var.ecr_force_delete

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Service = "booking-service"
  }
}

resource "aws_ecr_repository" "payment_service" {
  name                   = "ticketing-payment-service"
  image_tag_mutability   = "MUTABLE"
  force_delete           = var.ecr_force_delete

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Service = "payment-service"
  }
}

resource "aws_ecr_repository" "notification_service" {
  name                   = "ticketing-notification-service"
  image_tag_mutability   = "MUTABLE"
  force_delete           = var.ecr_force_delete

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Service = "notification-service"
  }
}

data "aws_caller_identity" "current" {}
