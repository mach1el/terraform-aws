// Provider
variable aws_region {}

// Networking
variable vpc_cidr_block {
  type        = string
  description = "Set your VPC IPs range" 
}

variable instance_tenancy {
  type        = string
  default     = "default"
  description = "Optional a tenancy option for instances launched into the VPC"
}

variable enable_dns_hostnames {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
}

variable enable_dns_support {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable private_net {
  type        = list
  default     = []
  description = "List of your private subnets"
}

variable public_net {
  type        = list
  default     = []
  description = "List of your public subnets"
}

variable tag {
  type    = string
  default = "My Clusters" 
}

variable private_subnet_tags {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable public_subnet_tags {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

// Conditions
variable create_public_subnet {
  type    = bool
  default = true
}

variable create_private_subnet {
  type    = bool
  default = true
}

variable create_public_rtb {
  type        = bool
  default     = true
  description = "Optional to create default public route table"
}

variable create_private_rtb {
  type        = bool
  default     = true
  description = "Optional to create default private route table"
}