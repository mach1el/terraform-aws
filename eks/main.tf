module "iam_roles" {
  source    = "./modules/iam_roles"
  role_name = var.cluster_role_name
}

resource "aws_eks_cluster" "this" {
  name     = "${var.cluster_name}"
  version  = "${var.kube_version}"
  role_arn = module.iam_roles.this_cluster.arn

  vpc_config {
    subnet_ids = "${var.subnet_ids}"
    endpoint_private_access = true
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  
  depends_on = [ module.iam_roles ]
}

/* resource "aws_eks_addon" "kube_proxy" {
  count = var.enable_kube_proxy_addon ? 1 : 0

  cluster_name      = aws_eks_cluster.this.name
  addon_name        = "kube-proxy"
  resolve_conflicts = "OVERWRITE"
  addon_version     = var.addon_kube_proxy_version
  
  tags = var.addon_tags
} */