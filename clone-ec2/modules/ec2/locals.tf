locals {
  cloneList = flatten(var.cloneList)
}

locals {
  cloned = [
    for cloned_ec2 in var.AMIsList: {
      id   = cloned_ec2.id
      name = cloned_ec2.tags.Name 
    }
  ]
}

locals {
  AMIs = flatten(local.cloned)
}