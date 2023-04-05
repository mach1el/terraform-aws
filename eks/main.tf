module "iam_roles" {
  source    = "./modules/iam_roles"
  role_name = var.cluster_role_name
}

resource "aws_eks_cluster" "this" {
  name     = "${var.cluster_name}"
  version  = "${var.kube_version}"
  role_arn = "${module.iam_roles.this_cluster.arn}"

  vpc_config {
    subnet_ids = "${var.subnet_ids}"
    endpoint_private_access = true
  }

  enabled_cluster_log_types = "${var.cluster_log_types}"
  
  depends_on = [ module.iam_roles ]
}

resource "aws_eks_addon" "kube_proxy" {
  count = var.enable_kube_proxy_addon ? 1 : 0

  cluster_name             = aws_eks_cluster.this.id
  addon_name               = "kube-proxy"
  resolve_conflicts        = try("${var.kube_proxy_conf.resolve_conflicts}","OVERWRITE")
  addon_version            = try("${var.kube_proxy_conf.addon_version}","${data.aws_eks_addon_version.kube-proxy.version}")
  service_account_role_arn = try("${var.kube_proxy_conf.service_account_role_arn}", null)
  preserve                 = try("${var.kube_proxy_conf.preserve}", true)
  /* tags = var.addon_tags */
}