// Providers
variable "aws_region" {}
variable "access_key" {}
variable "secret_key" {}

// Required Variables
variable vpc_cdir_block {}
variable priv_subnet_cdir_block {}
variable publ_subnet_cdir_block {}
variable tag_name {}

// Conditions
variable create_priv_subnet {
  type    = bool
  default = true
}
variable create_publ_subnet {
  type    = bool
  default = true
}
variable create_igw {
  type    = bool
  default = true
}
variable create_nat_gw {
  type    = bool
  default = true
}
variable create_eip {
  type    = bool
  default = true
}
variable create_privRT {
  type    = bool
  default = true
}
variable create_publRT {
  type    = bool
  default = true
}