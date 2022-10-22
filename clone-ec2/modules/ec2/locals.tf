locals {
  cloneList = flatten(var.cloneList)
}

locals {
  AMIs = flatten(toset(var.AMIList))
}