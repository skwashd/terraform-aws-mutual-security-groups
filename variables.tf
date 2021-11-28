variable "rules" {
  type = list(object({
    source_sg_id     = string
    target_sg_id     = string
    destination_port = string
    description      = string
    to_port          = optional(string)
    protocol         = optional(string)
  }))
  description = "Rules for which traffic is permitted between two security groups"
}

locals {
  rules = defaults(var.rules[*], {
    protocol = "tcp"
  })
  to_port = [for i, to_port in var.rules : var.rules[i].to_port == null ? var.rules[i].destination_port : var.rules[i].to_port]
}
