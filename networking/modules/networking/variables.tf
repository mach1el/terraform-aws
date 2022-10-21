// AZ
variable private_subnet_az {}
variable public_subnet_az {}

// Networking
variable vpc_cdir_block {}
variable private_net {}
variable public_net {}

variable tag {
  type    = string
  default = "My Clusters" 
}

// Conditions
variable create_private_subnet {
  type    = bool
  default = false
}
variable create_public_subnet {
  type    = bool
  default = true
}
variable create_igw {
  type    = bool
  default = true
}