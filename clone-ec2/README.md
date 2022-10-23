# Terraform Clone EC2 instance

Automatic getting your instance's data with Terraform `data source`

## Example
Put this configuration into your inventory

```
module "clone_ec2" {
  source     = "git::https://github.com/mach1el/terraform-aws.git//clone-ec2"
  aws_region = "ap-northeast-1"
  access_key = "qwerty123"
  secret_key = "zxcvbnm456"
  ec2List    = ["i-qwerty098765"]
}
```

You can also put variables into `terraform.tfvars`, it must same path with `main.tf` inventory

```
module "ec2" {
  source     = "git::https://github.com/mach1el/terraform-aws.git//clone-ec2"
  aws_region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
  ec2List    = var.ec2List
}
```

`terraform.tfvars`

```
// Provider
aws_region = "ap-southeast-1"
access_key = "abcxyz"
secret_key = "12345abc"
// EC2
ec2List    = ["i-qwerty098765"]
```

## Input
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|<a name="aws_region"></a> [aws_region](#) | Select your region | `string` | `null` | yes |
|<a name="access_key"></a> [access_key](#) | Your AMI access key id | `string` | `null` | yes |
|<a name="secret_key"></a> [secret_key](#) | Your AMI secret key | `string` | `null` | yes |
|<a name="ec2List"></a> [ec2List](#) | List of ec2 ids | `list` | `null` | yes |