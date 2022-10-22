locals {
  cloneList = flatten(var.cloneList)
}

locals {
  cloned = [
    {
      for ami in var.AMIList: ami.id => ami
    }
  ]
}

locals {
  AMIs = flatten(local.cloned)
}