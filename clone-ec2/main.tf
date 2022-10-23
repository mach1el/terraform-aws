module clone_ec2 {
  source  = "./modules/clone"
  ec2List = local.ec2List
}

resource "aws_instance" "new" {
  depends_on             = [module.clone_ec2]
  for_each               = { for ami in module.clone_ec2.AMIsList: ami.name => ami }
  ami                    = "${each.value.id}"
  instance_type          = "${data.aws_instance.source_instance[each.value.source_instance_id].instance_type}"
  subnet_id              = "${data.aws_instance.source_instance[each.value.source_instance_id].subnet_id}"
  vpc_security_group_ids = "${data.aws_instance.source_instance[each.value.source_instance_id].vpc_security_group_ids}"
  key_name               = "${data.aws_instance.source_instance[each.value.source_instance_id].key_name}"
  
  root_block_device {
    volume_size = "${flatten(data.aws_instance.source_instance[each.value.source_instance_id].root_block_device)[0].volume_size}"
    volume_type = "${flatten(data.aws_instance.source_instance[each.value.source_instance_id].root_block_device)[0].volume_type}"
    tags   = {
      Name = "${data.aws_instance.source_instance[each.value.source_instance_id].tags.Name}-clone"
    }
  }

  tags   = {
    Name = "${data.aws_instance.source_instance[each.value.source_instance_id].tags.Name}-clone"
  }
}