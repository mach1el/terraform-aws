resource "aws_ami_from_instance" "clone" {
  for_each           = { for ec2 in var.ec2List: ec2.source_instance_id => ec2  }
  name               = "${each.value.name}"
  source_instance_id = "${each.value.source_instance_id}"
  tags   = {
    Name = "${each.value.name}"
  }
}