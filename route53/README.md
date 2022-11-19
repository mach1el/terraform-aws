# Terraform AWS Route53 module


## Example
Put this configuration into your inventory

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "ap-southeast-1"
  access_key = "your access key"
  secret_key = "your secret key"
}

module "route53_zone" {
  source      = "git::https://github.com/mach1el/terraform-aws.git//route53/modules/zones"
  domain_name = "spiritsec.net"
  vpc_ids     = [
    {
      vpc_id = "vpc-abcxyz12345"
    }
  ]
}

output private_zone {
  value = module.route53_zone.private_zone
}

module "route53_private_records" {
  source          = "git::https://github.com/mach1el/terraform-aws.git//route53/modules/records"
  private_zone_id = module.route53_zone.private_zone
  private_records = [
    {
      name    = "node-1"
      type    = "A"
      ttl     = "60"
      records = ["10.10.94.120"]
    },
    {
      name    = "devops-1"
      type    = "CNAME"
      ttl     = "60"
      records = ["node-1.spiritsec.net"]
    }
  ]
}
```

## Input for Zone
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|<a name="domain_name"></a> [domain_name](#) | Set your domain name for Zone | `string` | `null` | yes |
|<a name="default_vpc_region"></a> [default_vpc_region](#) | Default region working on  | `string` | `ap-southeast-1` | no |
|<a name="vpc_ids"></a> [vpc_ids](#) | VPC id and VPC region(if from other region) | `list(map(string))` | `[]` | no |

## Input for Records
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|<a name="public_zone_id"></a> [public_zone_id](#) | Where public zone to create records on | `string` | `""` | yes |
|<a name="private_zone_id"></a> [private_zone_id](#) | Where private zone to create records on  | `string` | `""` | yes |
|<a name="public_records"></a> [public_records](#) | List of objects of DNS public records | `any` | `[]` | no |
|<a name="private_records"></a> [private_records](#) | List of objects of DNS private records | `any` | `[]` | no |