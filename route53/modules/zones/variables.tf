variable domain_name {
  description = "Set domain name for hosted zone"
}

variable default_vpc_region {
  type    = string
  default = "ap-southeast-1"
}

variable "vpc_ids" {
  type        = list(map(string))
  description = "VPC ID's that will be associated with this hosted zone"
  default     = []
}