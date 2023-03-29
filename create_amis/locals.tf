locals {
  data = [
    for ec2 in var.ec2_ids: {
      name               = "${data.aws_instance.source_instance[ec2].tags.Name}"
      source_instance_id = ec2
    }
  ]
}

locals {
  ec2_ids = flatten(local.data)
}