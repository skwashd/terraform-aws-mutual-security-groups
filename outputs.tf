output "ingress_rules" {
  value       = aws_security_group_rule.ingress[*].id
  description = "The List of the Security Group Ingress Rules IDs"
}

output "egress_rules" {
  value       = aws_security_group_rule.egress[*].id
  description = "The List of the Security Group Egress Rules IDs"
}
