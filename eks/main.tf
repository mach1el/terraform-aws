module "iam_roles" {
  source    = "./modules/iam_roles"
  role_name = "MyApp-cluster-roles"
}

module "vpc" {
  source                = "git::https://github.com/mach1el/terraform-aws.git//networking"
  aws_region            = var.aws_region
  vpc_cdir_block        = var.vpc_cdir_block
  private_net           = var.private_net
  public_net            = var.public_net
  tag                   = var.tag
  private_subnet_tags   = {
    "kubernetes.io/cluster/${var.tag}" = "shared"
  }
  public_subnet_tags    = {
    "kubernetes.io/cluster/${var.tag}" = "shared"
  }
}

# output public_subnet_ids {
#   value = module.vpc.public_subnet_ids
# }

locals {
  # private_subnet_ids = module.vpc.private_subnet_ids : ?
  available_subnets = try(concat(module.vpc.private_subnet_ids,module.vpc.public_subnet_ids),"Got null variable")
}

# resource "aws_eks_cluster" "this" {
#   name     = "${var.tag}"
#   role_arn = module.iam_roles.this_cluster.arn

#   vpc_config {
#     subnet_ids = local.available_subnets
#   }

  # depends_on = [
  #   "module.iam_roles.aws_iam_role_policy_attachment.AmazonEKSClusterPolicy",
  #   "module.iam_roles.aws_iam_role_policy_attachment.AmazonEKSServicePolicy",
  # ]
# }