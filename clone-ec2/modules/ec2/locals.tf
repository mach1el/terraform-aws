locals {
  cloneList = flatten(var.cloneList)
}

locals {
  cloned = [
    {
      for ami in var.AMIList: ami.tags["Name"] => ami.id
    }
  ]
}

locals {
  AMIs = flatten(local.cloned)
}