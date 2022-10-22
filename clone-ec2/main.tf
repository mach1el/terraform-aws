module "cloneAMI" {
  source    = "./modules/clone"
  cloneList = variable.cloneList
}