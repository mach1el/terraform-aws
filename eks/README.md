# Terraform AWS Network - VPC | Subnet | Route Table | IGW | NAT gateway | Elastic IPs

* Using conditions for creating Public Subnet and Private Subnet
* Will create public subnet as default

## Example
Put this configuration into your inventory

```
module "networking" {
  source         = "git::https://github.com/mach1el/terraform-aws.git//eks"
  role_name      = "MyApp-cluster-roles"
  aws_region     = "us-east-2"
  vpc_cidr_block = "10.10.98.0/16"
  private_net    = ["10.98.1.0/24","10.98.2.0/24"]
  public_net     = ["10.98.10.0/24","10.98.11.0/24"]
  tag            = "MyApp-cluster"
}
```

You can also put variables into `terraform.tfvars`, it must same path with `main.tf` inventory

```
module "networking" {
  source         = "git::https://github.com/mach1el/terraform-aws.git//eks"
  role_name      = var.role_name
  aws_region     = var.aws_region
  vpc_cidr_block = var.vpc_cidr_block
  private_net    = var.private_net
  public_net     = var.public_net
  tag            = var.tag
}
```

`terraform.tfvars`

```
// Provider
aws_region = "ap-southeast-1"
// IAM
role_name = "MyApp-cluster-roles"
// Network
vpc_cidr_block = "10.98.0.0/16"
private_net    = ["10.98.1.0/24","10.98.2.0/24"]
public_net     = ["10.98.10.0/24","10.98.11.0/24"]
```

## Input
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|<a name="aws_region"></a> [aws_region](#) | Select your region | `string` | `null` | yes |
|<a name="role_name"></a> [role_name](#) | Set your IAM role name for EKS cluster | `string` | `MyApp-cluster-roles` | no |
|<a name="vpc_cidr_block"></a> [vpc_cidr_block](#) | Your VPC range | `string` | `null` | yes |
|<a name="private_net"></a> [private_net](#) | List of subnets range | `list` | `null` | yes |
|<a name="public_net"></a> [public_net](#) | List of subnets range | `list` | `null` | yes |
|<a name="tag"></a> [tag](#) | Tag your resource | `string` | `MyApp-cluster` | no |