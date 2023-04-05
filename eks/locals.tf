locals {
  kube_version  = var.kube_version != null ? var.kube_version : data.aws_eks_cluster.eks_cluster.version
}