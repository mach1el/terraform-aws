module "cloneAMI" {
  source    = "./modules/clone"
  cloneList = var.cloneList
}

module "ec2" {
 source  = "./modules/ec2"
 AMIList = module.cloneAMI.AMIs  
}