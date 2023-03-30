module "public_subnet_az" {
  source     = "./modules/random_shuffle"
  input      = "${data.aws_availability_zones.available.names}"
  subnetList = var.public_net
}

module "private_subnet_az" {
  source     = "./modules/random_shuffle"
  input      = "${data.aws_availability_zones.available.names}"
  subnetList = var.private_net
}

module "networking" {
  source                = "./modules/networking"
  vpc_cdir_block        = var.vpc_cdir_block
  private_net           = var.private_net
  public_net            = var.public_net
  create_private_subnet = var.create_private_subnet
  create_public_subnet  = var.create_public_subnet
  public_subnet_az      = module.public_subnet_az.result
  private_subnet_az     = module.private_subnet_az.result
  tag                   = var.tag
  public_subnet_tags    = var.public_subnet_tags
  private_subnet_tags   = var.private_subnet_tags
}