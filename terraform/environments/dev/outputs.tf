# Dev environment outputs

output "cluster_name" {
  value = aws_eks_cluster.ticketing.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.ticketing.endpoint
}

output "vpc_id" {
  value = aws_vpc.ticketing.id
}

output "security_group_id" {
  value = aws_security_group.ticketing.id
}
