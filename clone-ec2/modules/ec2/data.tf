data "aws_instance" "source_instance" {
  for_each    = { for ami in local.cloneList: ami.name => ami }
  instance_id = "${each.value.source_id}"
}