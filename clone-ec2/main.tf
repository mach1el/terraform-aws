module "cloneAMI" {
  source    = "./modules/clone"
  cloneList = var.cloneList
}