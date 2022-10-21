# Terraform AWS EC2


## Example
Put this configuration into your inventory

```
module "ec2" {
  source        = "git::https://github.com/mach1el/terraform-aws.git//ec2"
  aws_region    = "ap-northeast-1"
  access_key    = "qwerty123"
  secret_key    = "zxcvbnm456"
  configuration = [
    {
      "service_name" : "Demo machine",
      "ami" : "	ami-123456789",
      "instance_type" : "t2.small",
      "subnet_id" : "subnet-12345",
      "ssh_key_name" : "vpc",
      "vpc_security_group_ids" : ["sg-123abc"],
      "volume_size" : "40",
      "volume_type" : "gp3",
      "system_name" : "Demo"
    }
  ]
}
```

You can also put variables into `terraform.tfvars`, it must same path with `main.tf` inventory

```
module "ec2" {
  source        = "git::https://github.com/mach1el/terraform-aws.git//ec2"
  aws_region    = var.aws_region
  access_key    = var.access_key
  secret_key    = var.secret_key
  configuration = var.configuration
}
```

`terraform.tfvars`

```
// Provider
aws_region = "ap-southeast-1"
access_key = "abcxyz"
secret_key = "12345abc"
//EC2
configuration = [
  {
    "service_name" : "Demo machine",
    "ami" : "	ami-123456789",
    "instance_type" : "t2.small",
    "subnet_id" : "subnet-12345",
    "ssh_key_name" : "vpc",
    "vpc_security_group_ids" : ["sg-123abc"],
    "volume_size" : "40",
    "volume_type" : "gp3",
    "system_name" : "Demo"
  }
]
```