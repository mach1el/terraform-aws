data "aws_eks_addon_version" "kube-proxy" {
  addon_name         = "kube-proxy"
  kubernetes_version = "${var.kube_version}"
  most_recent        = try(var.addon_conf.most_recent, false)
}

data "aws_eks_addon_version" "coredns" {
  addon_name         = "coredns"
  kubernetes_version = "${var.kube_version}"
  most_recent        = try(var.addon_conf.most_recent, false)
}

data "aws_eks_addon_version" "vpc-cni" {
  addon_name         = "vpc-cni"
  kubernetes_version = "${var.kube_version}"
  most_recent        = try(var.addon_conf.most_recent, false)
}