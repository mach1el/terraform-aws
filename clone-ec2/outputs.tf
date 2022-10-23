output ami_ids {
  value = toset([
    for ami in module.clone_ec2.AMIsList: {
      id                 = ami.id
      name               = ami.name
      source_instance_id = ami.source_instance_id
    } 
  ])
}

output new_instances {
  value = toset([
    for ec2 in aws_instance.new: {
      id         = ec2.id
      name       = ec2.tags.Name
      private_ip = ec2.private_ip
    }
  ])
}