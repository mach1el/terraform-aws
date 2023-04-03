// Providers
variable "aws_region" {}

// VPC
variable "vpc_cidr_block" {
  description = "Set cidr range for your EKS VPC cluster" 
  type        = string
}
variable "private_net" {
  description = "List of private subnets which nodes are being created on it"
  type        = list(string)
}
variable "public_net"  {
  description = "List of public subnets which nodes are being created on it"
  type        = list(string)
}
variable "tag" {
  description = "Tag your resource"
  type        = string
  default     = "MyApp-cluster"
}

// IAM roles
variable "role_name" {
  description = "Set IAM role name which is being used for EKS cluster"
  type        = string
  default     = "MyApp-cluster-role"
}