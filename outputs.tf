output "ingress_rules" {
  value       = [for sg in aws_vpc_security_group_ingress_rule.this : sg.id]
  description = "The List of the Security Group Ingress Rules IDs"
}

output "egress_rules" {
  value       = [for sg in aws_vpc_security_group_egress_rule.this : sg.id]
  description = "The List of the Security Group Egress Rules IDs"
}
