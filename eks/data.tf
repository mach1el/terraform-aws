data "aws_eks_cluster" "eks_cluster" {
  name = time_sleep.dataplane.triggers["eks_cluster_id"]
}

data "aws_eks_addon_version" "kube-proxy" {
  addon_name = "kube-proxy"
}