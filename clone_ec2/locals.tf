locals {
  source_ids = toset(var.ec2List)
}

locals {
  data = [
    for ec2 in var.ec2List: {
      name               = "${data.aws_instance.source_instance[ec2].tags.Name}"
      source_instance_id = ec2
    }
  ]
}

locals {
  ec2List = flatten(local.data)
}