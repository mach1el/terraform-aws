// Providers
variable "aws_region" {}

// IAM roles
variable "cluster_role_name" {
  type        = string
  default     = "MyApp-cluster-role"
  description = "Set IAM role name which is being used for EKS cluster"
}

variable "node_role_name" {
  type        = string
  default     = "MyApp-cluster-nodes-role"
  description = "Set IAM role name which is being used for EKS nodes group"
}

// EKS
variable "cluster_name" {
  type        = string
  default     = "Phantom"
  description = "Naming your cluster"
}

variable "kube_version" {
  type        = any
  default     = null
  description = "Pick available kubernetest version"
}

variable "eks_vpc_config" {
  type        = any
  description = "List of available subnets" 
}

variable "cluster_log_types" {
  type        = list
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  description = "Enable logging specify type for control panel"
}

variable "enable_kube_proxy_addon" {
  type        = bool
  default     = true
  description = "Optional to enable kube proxy add-on in cluster"
}

variable "enable_coredns_addon" {
  type        = bool
  default     = true
  description = "Optional to enable coredns add-on in cluster"
}

variable "enable_vpc_cni_addon" {
  type        = bool
  default     = true
  description = "Optional to enable vpc-cni add-on in cluster"
}

variable "addon_conf" {
  type        = map(any)
  default     = {}
  description = "Optional configure addons"
}