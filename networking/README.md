# Terraform AWS Network - VPC | Subnet | Route Table | IGW | NAT gateway | Elastic IPs

* Using conditions for creating Public Subnet and Private Subnet
* Will create public subnet as default

## Example
Put this configuration into your inventory

```
module "networking" {
  source         = "git::https://github.com/mach1el/terraform-aws.git//networking"
  aws_region     = "ap-northeast-1"
  vpc_cidr_block = "10.10.98.0/16"
  private_net    = ["10.98.1.0/24","10.98.2.0/24"]
  public_net     = ["10.98.10.0/24","10.98.11.0/24"]
  tag            = "KubeClusters"
}
```

You can also put variables into `terraform.tfvars`, it must same path with `main.tf` inventory

```
module "networking" {
  source         = "git::https://github.com/mach1el/terraform-aws.git//networking"
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
// Network
vpc_cidr_block = "10.98.0.0/16"
private_net    = ["10.98.1.0/24","10.98.2.0/24"]
public_net     = ["10.98.10.0/24","10.98.11.0/24"]
```

## Input
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|<a name="aws_region"></a> [aws_region](#) | Select your region | `string` | `null` | yes |
|<a name="vpc_cidr_block"></a> [vpc_cidr_block](#) | Your VPC range | `string` | `null` | yes |
|<a name="instance_tenancy"></a> [instance_tenancy](#) | Tenancy option | `string` | `default` | no |
|<a name="enable_dns_hostnames"></a> [enable_dns_hostnames](#) | Enable dns hostnames in your VPC | `bool` | `false` | no |
|<a name="enable_dns_support"></a> [enable_dns_support](#) | Enable dns support in your VPC | `bool` | `true` | no |
|<a name="private_net"></a> [private_net](#) | List of subnets range | `list` | `[]` | yes |
|<a name="public_net"></a> [public_net](#) | List of subnets range | `list` | `[]` | yes |
|<a name="create_private_subnet"></a> [create_private_subnet](#) | Conditional variable for create private subnet | `boolean` | `true` | no |
|<a name="create_public_subnet"></a> [create_public_subnet](#) | Conditional variable for create public subnet | `boolean` | `true` | no |
|<a name="create_igw"></a> [create_igw](#) | Conditional variable for create internet gateway | `boolean` | `true` | no |
|<a name="tag"></a> [tag](#) | Tag your resource | `string` | `My Clusters` | no |
|<a name="private_subnet_tags"></a> [private_subnet_tags](#) | Additional tags for subnet | `map(string)` | `{}` | no |
|<a name="public_subnet_tags"></a> [public_subnet_tags](#) | Additional tags for subnet | `map(string)` | `{}` | no |