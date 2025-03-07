<!-- BEGIN_TF_DOCS -->
# Terraform Mutual Security Groups Rules Module

**This branch is unmaintained.**

This module creates mutual AWS security group rules where matching ingress
and egress to allow traffic between two security groups. This makes it easier
to create security network configuration in your AWS environments.

----

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.67.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rules"></a> [rules](#input\_rules) | Rules for which traffic is permitted between two security groups | <pre>list(object({<br/>    source_sg_id     = string<br/>    target_sg_id     = string<br/>    destination_port = string<br/>    description      = string<br/>    to_port          = optional(string)<br/>    protocol         = optional(string)<br/>  }))</pre> | n/a | yes |

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
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
<!-- END_TF_DOCS -->

## Samples

```hcl
 rules= [
     {
         source_sg_id = "sg-903004f8"
         target_sg_id = "sg-33bb22aa"
         destination_port = "443"
         protocol = "udp" # Optional, defaults to tcp
         description = "Allow QUIC/HTTP3 from NLB" # optional, but recommended
     },
     {
         source_sg_id = "sg-1a2b3c4d"
         target_sg_id = "sg-33bb22aa"
         destination_port = "8080"
         to_port   = "8088" # Optional, only required for port ranges. Specifies the upper end of the range.
     }
 ]
```
