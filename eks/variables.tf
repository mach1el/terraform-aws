// Providers
variable "aws_region" {}

// IAM roles
variable "role_name" {
  type        = string
  default     = "MyApp-cluster-role"
  description = "Set IAM role name which is being used for EKS cluster"
}

// EKS
variable "kube_version" {
  type        = any
  default     = null
  description = "Pick available kubernetest version"
}

variable "subnet_ids" {
  type        = list
  description = "List of available subnets"
}

variable "enable_kube_proxy_addon" {
  type        = bool
  default     = true
  description = "Optional to enable kube proxy add-on in cluster"
}

variable "kube_proxy_addon_ver" {
  type        = string
  description = "Pick version for kube proxy add-on"
}