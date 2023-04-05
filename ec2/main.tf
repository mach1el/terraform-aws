resource "aws_instance" "new" {
  for_each = {for server in local.instances: server.instance_name => server}

  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  subnet_id                   = each.value.subnet_id
  key_name                    = each.value.ssh_key_name
  vpc_security_group_ids      = each.value.security_groups
  associate_public_ip_address = each.value.public_ip
  
  root_block_device {
    volume_size = each.value.volume_size
    volume_type = each.value.volume_type
    tags   = {
      Name = each.value.instance_name
    }
  }

  tags = {
    Name   = each.value.instance_name
    System = each.value.system_name
  }
}