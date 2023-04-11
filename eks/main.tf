module "iam_cluster_roles" {
  source    = "./modules/iam_cluster_roles"
  role_name = "${var.cluster_role_name}"
}

module "iam_node_roles" {
  source    = "./modules/iam_node_roles"
  role_name = "${var.node_role_name}"
}

resource "aws_eks_cluster" "this" {
  name     = "${var.cluster_name}"
  version  = "${var.kube_version}"
  role_arn = "${module.iam_cluster_roles.this_cluster_role.arn}"

  vpc_config {
    subnet_ids              = lookup(var.eks_vpc_config,"subnet_ids",[])
    endpoint_private_access = lookup(var.eks_vpc_config,"endpoint_private_access",false)
    endpoint_public_access  = lookup(var.eks_vpc_config,"endpoint_public_access",true)
    public_access_cidrs     = lookup(var.eks_vpc_config,"public_access_cidrs",["0.0.0.0/0"])
    security_group_ids      = lookup(var.eks_vpc_config,"security_group_ids",[])
  }

  enabled_cluster_log_types = "${var.cluster_log_types}"
  
  depends_on = [ module.iam_cluster_roles ]
}

resource "aws_eks_addon" "kube_proxy" {
  count = var.enable_kube_proxy_addon ? 1 : 0

  cluster_name             = aws_eks_cluster.this.id
  addon_name               = "kube-proxy"
  resolve_conflicts        = try("${var.addon_conf.resolve_conflicts}","OVERWRITE")
  addon_version            = try("${var.addon_conf.kube_proxy_ver}","${data.aws_eks_addon_version.kube-proxy.version}")
  service_account_role_arn = try("${var.addon_conf.service_account_role_arn}", null)
  preserve                 = try("${var.addon_conf.preserve}", true)
  tags                     = try("${var.addon_conf.addon_tags}",{})
}

resource "aws_eks_addon" "coredns" {
  count = var.enable_coredns_addon ? 1 : 0

  cluster_name             = aws_eks_cluster.this.id
  addon_name               = "coredns"
  resolve_conflicts        = try("${var.addon_conf.resolve_conflicts}","OVERWRITE")
  addon_version            = try("${var.addon_conf.coredns_ver}","${data.aws_eks_addon_version.coredns.version}")
  service_account_role_arn = try("${var.addon_conf.service_account_role_arn}", null)
  preserve                 = try("${var.addon_conf.preserve}", true)
  tags                     = try("${var.addon_conf.addon_tags}",{})
}

resource "aws_eks_addon" "vpc_cni" {
  count = var.enable_vpc_cni_addon ? 1 : 0

  cluster_name             = aws_eks_cluster.this.id
  addon_name               = "vpc-cni"
  resolve_conflicts        = try("${var.addon_conf.resolve_conflicts}","OVERWRITE")
  addon_version            = try("${var.addon_conf.vpc_cni_ver}","${data.aws_eks_addon_version.vpc-cni.version}")
  service_account_role_arn = try("${var.addon_conf.service_account_role_arn}", null)
  preserve                 = try("${var.addon_conf.preserve}", true)
  tags                     = try("${var.addon_conf.addon_tags}",{})
}