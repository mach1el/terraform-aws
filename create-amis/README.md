# Terraform AWS create AMIs module


## Example
Put this configuration into your inventory

```
module "clone_ec2" {
  source     = "git::https://github.com/mach1el/terraform-aws.git//create-amis"
  aws_region = "ap-northeast-1"
  access_key = "qwerty123"
  secret_key = "zxcvbnm456"
  ec2_ids = [
    "i-abc123"
  ]
}
```

You can also put variables into `terraform.tfvars`, it must same path with `main.tf` inventory

```
module "security_group" {
  source     = "git::https://github.com/mach1el/terraform-aws.git//create-amis"
  aws_region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
  ec2_ids    = var.ec2_ids
```

`terraform.tfvars`

```
// Providers
aws_region = "ap-southeast-1"
access_key = "qwerty123"
secret_key = "zxcvbnm456"

// EC2
ec2_ids = [
  "i-abc123"
]
```

## Input
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|<a name="aws_region"></a> [aws_region](#) | Select your region | `string` | `null` | yes |
|<a name="access_key"></a> [access_key](#) | Your AMI access key id | `string` | `null` | yes |
|<a name="secret_key"></a> [secret_key](#) | Your AMI secret key | `string` | `null` | yes |
|<a name="ec2_ids"></a> [ec2_ids](#) | List of ec2 ids | `list` | `[]` | yes |
|<a name="create_timeout"></a> [create_timeout](#) | Option timeout to create AMIs | `string` | `1h` | yes |