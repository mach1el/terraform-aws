# Terraform AWS Security Group module


## Example
Put this configuration into your inventory

```
module "security_group" {
  source     = "git::https://github.com/mach1el/terraform-aws.git//security-groups"
  aws_region = "ap-northeast-1"
  access_key = "qwerty123"
  secret_key = "zxcvbnm456"
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
  source     = "git::https://github.com/mach1el/terraform-aws.git//security-group"
  aws_region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
  vpc_id     = var.vpc_id
  sgData     = var.sgData
}
```

`terraform.tfvars`

```
// Providers
aws_region = "ap-southeast-1"
access_key = "qwerty123"
secret_key = "zxcvbnm456"

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
|<a name="access_key"></a> [access_key](#) | Your AMI access key id | `string` | `null` | yes |
|<a name="secret_key"></a> [secret_key](#) | Your AMI secret key | `string` | `null` | yes |