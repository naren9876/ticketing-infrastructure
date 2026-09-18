# Ticketing Platform Infrastructure

## Directory Structure
- `terraform/` - AWS infrastructure (EKS, RDS, VPC, etc)
- `kubernetes/` - Kubernetes manifests
  - `base/` - Core microservices (production-safe)
  - `overlays/dev/` - Development AI workloads
  - `overlays/staging/` - Staging environment
  - `overlays/production/` - Production environment

## Deployment
ArgoCD watches this repo and automatically deploys changes.
