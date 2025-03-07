variable "rules" {
  description = "Rules for which traffic is permitted between two security groups"

  type = map(
    object({
      source_sg_id = string
      target_sg_id = string

      from_port = number
      to_port   = optional(number)
      protocol  = optional(string, "tcp")

      description        = optional(string, "")
      description_source = optional(string, "")
      description_target = optional(string, "")
    })
  )

  validation {
    condition = alltrue([
      for rule in var.rules : (rule.description == "" && rule.description_source != "" && rule.description_target != "") || (rule.description != "" && rule.description_source == "" && rule.description_target == "")
    ])
    error_message = "Rules must have a description. Set either 'description' or 'description_source' and 'description_target'"
  }
}

variable "tags" {
  description = "Tags to apply to the rules"

  type    = map(string)
  default = {}
}
