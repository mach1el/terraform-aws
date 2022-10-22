locals {
  cloneList = flatten(var.cloneList)
}

locals {
  cloned = [
    for cloned_ec2 in var.AMIsList: {
      id   = clone_ec2.id
      name = clone_ec2.tags.Name 
    }
  ]
}

locals {
  AMIs = flatten(local.cloned)
}