resource "aws_instance" "new" {
  for_each               = { for ami in local.AMIs: ami.id => ami }
  ami                    = "${each.value.id}"
  instance_type          = "${data.aws_instance.source_instance[each.value.source_id].instance_type}"
  subnet_id              = "${data.aws_instance.source_instance[each.value.source_id].subnet_id}"
  vpc_security_group_ids = "${data.aws_instance.source_instance[each.value.source_id].vpc_security_group_ids}"
  key_name               = "${data.aws_instance.source_instance[each.value.source_id].key_name}"
  
  root_block_device {
    volume_size = "${data.aws_instance.source_instance[each.value.source_id].volume_size}"
    volume_type = "${data.aws_instance.source_instance[each.value.source_id].volume_type}"
    tags   = {
      Name = "${data.aws_instance.source_instance[each.value.source_id].tags.Name}-clone"
    }
  }

  tags   = {
    Name = "${data.aws_instance.source_instance[each.value.source_id].tags.Name}-clone"
  }
}