resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = var.rules

  security_group_id            = each.value.target_sg_id
  referenced_security_group_id = each.value.source_sg_id

  description = each.value.description == "" ? each.value.description_source : each.value.description
  from_port   = each.value.from_port
  to_port     = each.value.to_port == null ? each.value.from_port : each.value.to_port
  ip_protocol = each.value.protocol

  tags = var.tags
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = var.rules

  security_group_id            = each.value.source_sg_id
  referenced_security_group_id = each.value.target_sg_id

  description = each.value.description == "" ? each.value.description_target : each.value.description
  from_port   = each.value.from_port
  to_port     = each.value.to_port == null ? each.value.from_port : each.value.to_port
  ip_protocol = each.value.protocol

  tags = var.tags
}
