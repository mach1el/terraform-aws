resource "aws_ami_from_instance" "clone" {
  for_each           = { for ami in local.cloneList: ami.name => ami }
  name               = "${each.value.name}"
  source_instance_id = "${each.value.source_id}"
  tags   = {
    Name = "${each.value.name}"
  }
}