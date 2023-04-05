data "aws_eks_addon_version" "kube-proxy" {
  addon_name         = "kube-proxy"
  kubernetes_version = "${var.kube_version}"
  most_recent        = try(var.kube_proxy_conf.most_recent, false)
}