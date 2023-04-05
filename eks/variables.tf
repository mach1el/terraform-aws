// Providers
variable "aws_region" {}

// IAM roles
variable "cluster_role_name" {
  type        = string
  default     = "MyApp-cluster-role"
  description = "Set IAM role name which is being used for EKS cluster"
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

variable "subnet_ids" {
  type        = list
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

variable "kube_proxy_conf" {
  type        = map(string)
  default     = {
    most_recent = true
  }
  description = "Optional configure kube_proxy addon"
}