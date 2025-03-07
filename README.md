# Terraform Mutual Security Groups Rules Module

This module creates mutual AWS security group rules where matching ingress
and egress rules allow traffic between two security groups. This makes it easier
to create secure network configuration in your AWS environments.

## Example

```hcl
module "security_group_rules" {
  source  = "skwashd/mutual-security-groups/aws"
  version = ">= 2.0.0, < 3.0.0"

  rules = {
    lb-backend = {
      source_sg_id = "sg-903004f8"
      target_sg_id = "sg-33bb22aa"

      from_port = 443
      protocol  = "udp" # Optional, defaults to tcp

      description = "Allow QUIC/HTTP3 from NLB" # optional, but recommended
    },
    backend-frontend = {
      source_sg_id = "sg-1a2b3c4d"
      target_sg_id = "sg-33bb22aa"

      from_port = 8080
      to_port   = 8088 # Optional, only required for port ranges. Specifies the upper end of the range.

      description_source = "to backend"
      description_target = "from frontend"
    }
  }

  tags = {
    environment = "example"
  }
}
```

<!-- BEGIN_TF_DOCS -->


----

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0, < 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.90.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rules"></a> [rules](#input\_rules) | Rules for which traffic is permitted between two security groups | <pre>list(<br/>    object({<br/>      source_sg_id = string<br/>      target_sg_id = string<br/><br/>      from_port = number<br/>      to_port   = optional(number)<br/>      protocol  = optional(string, "tcp")<br/><br/>      description        = optional(string, "")<br/>      description_source = optional(string, "")<br/>      description_target = optional(string, "")<br/>    })<br/>  )</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the rules | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_egress_rules"></a> [egress\_rules](#output\_egress\_rules) | The List of the Security Group Egress Rules IDs |
| <a name="output_ingress_rules"></a> [ingress\_rules](#output\_ingress\_rules) | The List of the Security Group Ingress Rules IDs |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc_security_group_egress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
<!-- END_TF_DOCS -->