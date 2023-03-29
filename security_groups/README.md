# Terraform AWS Security Group module


## Example
Put this configuration into your inventory

```
module "security_group" {
  source     = "git::https://github.com/mach1el/terraform-aws.git//security_groups"
  aws_region = "ap-northeast-1"
  vpc_id     = "vpc-123456789"
  sgData     = [
    {
      "name" : "Demo",
      "ingress" : [
        {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = ["172.16.1.0/24"]
          description = "VPC Peering Connection"
        },
        {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = ["172.16.1.91/32"]
          description = "Gitlab Runner"
        }
      ]
    }
  ]
}
```

You can also put variables into `terraform.tfvars`, it must same path with `main.tf` inventory

```
module "security_group" {
  source     = "git::https://github.com/mach1el/terraform-aws.git//security_group"
  aws_region = var.aws_region
  vpc_id     = var.vpc_id
  sgData     = var.sgData
}
```

`terraform.tfvars`

```
// Providers
aws_region = "ap-southeast-1"

// VPC
vpc_id = "vpc-123456789"

// Security Groups
sgData = [
  {
    "name" : "Demo",
    "ingress" : [
      {
        from        = 22
        to          = 22
        protocol    = "tcp"
        cidr_blocks = ["172.16.1.0/24"]
        description = "VPC Peering Connection"
      },
      {
        from        = 22
        to          = 22
        protocol    = "tcp"
        cidr_blocks = ["172.16.1.91/32"]
        description = "Gitlab Runner"
      }
    ]
  }
]
```

## Input
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|<a name="aws_region"></a> [aws_region](#) | Select your region | `string` | `null` | yes |
|<a name="vpc_id"></a> [vpc_id](#) | ID of available VPC | `string` | `null` | yes |
|<a name="sgData"></a> [sgData](#) | List of securities will be created | `list` | `null` | yes |