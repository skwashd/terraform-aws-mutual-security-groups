resource "aws_security_group_rule" "ingress" {
  count = length(var.rules)

  type                     = "ingress"
  from_port                = var.rules[count.index].destination_port
  to_port                  = local.to_port[count.index]
  protocol                 = local.rules[count.index].protocol
  description              = var.rules[count.index].description
  source_security_group_id = var.rules[count.index].source_sg_id
  security_group_id        = var.rules[count.index].target_sg_id
}

resource "aws_security_group_rule" "egress" {
  count = length(var.rules)

  type                     = "egress"
  from_port                = var.rules[count.index].destination_port
  to_port                  = local.to_port[count.index]
  protocol                 = local.rules[count.index].protocol
  description              = var.rules[count.index].description
  source_security_group_id = var.rules[count.index].target_sg_id
  security_group_id        = var.rules[count.index].source_sg_id
}