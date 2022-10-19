# Terraform AWS Network - VPC | Subnet | Route Table | IGW | NAT gateway | Elastic IPs

* Can set condition to create resource eg. `create_priv_subnet = false`

## Variables conditional 

* create_priv_subnet
* create_publ_subnet
* create_igw
* create_nat_gw
* create_eip
* create_privRT
* create_publRT

## Example
Put this configuration into your inventory

```
module "security_group" {
  source                 = "https://github.com/mach1el/terraform-aws.git//tf-aws-network"
  aws_region             = "ap-northeast-1"
  access_key             = "qwerty123"
  secret_key             = "zxcvbnm456"
  vpc_cdir_block         = "10.30.0.0/16"
  publ_subnet_cdir_block = "10.30.1.0/24"
  priv_subnet_cdir_block = "10.30.2.0/24"
  tag_name               = "StagingUnity"
}
```

You can also put variables into `terraform.tfvars`, it must same path with `main.tf` inventory

```
module "security_group" {
  source                 = "https://github.com/mach1el/terraform-aws.git//tf-aws-network"
  aws_region             = var.aws_region
  access_key             = var.access_key
  secret_key             = var.secret_key
  vpc_cdir_block         = var.vpc_cdir_block
  publ_subnet_cdir_block = var.publ_subnet_cdir_block
  priv_subnet_cdir_block = var.priv_subnet_cdir_block
  tag_name               = var.tag_name
}
```

`terraform.tfvars`

```
// Providers
aws_region = "ap-southeast-1"
access_key = "qwerty123"
secret_key = "zxcvbnm456"

// Network
vpc_cdir_block         = "10.98.0.0/16"
priv_subnet_cdir_block = "10.98.1.0/24"
publ_subnet_cdir_block = "10.98.2.0/24"
tag_name               = "KubeClusters"

//Conditions
create_priv_subnet = false
create_nat_gw      = false
create_eip         = false
create_privRT      = false
```