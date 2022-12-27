// Provider
variable "aws_region" {}
variable "access_key" {}
variable "secret_key" {}

// EC2
variable ec2_ids {
  default     = []
  description =  "List of ec2 ids that will be used to create AMIs"
}
variable create_timeout {
  type        = string
  default     = "1h"
  description = "Timeout to create AMIs"
}