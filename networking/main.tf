module "private_subnet_az" {
  source     = "./modules/random_shuffle"
  input      = "${data.aws_availability_zones.available.names}"
  subnetList = var.private_net
}

module "public_subnet_az" {
  source     = "./modules/random_shuffle"
  input      = "${data.aws_availability_zones.available.names}"
  subnetList = var.public_net
}

module "networking" {
  source            = "./modules/networking"
  vpc_cdir_block    = var.vpc_cdir_block
  private_net       = var.private_net
  public_net        = var.public_net
  private_subnet_az = module.private_subnet_az.result
  public_subnet_az  = module.public_subnet_az.result
  tag               = var.tag
}