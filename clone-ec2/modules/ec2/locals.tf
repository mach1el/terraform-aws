locals {
  cloneList = flatten(var.cloneList)
}

locals {
  AMIs = flatten(var.AMIList)
}
