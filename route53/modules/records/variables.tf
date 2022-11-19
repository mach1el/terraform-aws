variable public_zone_id {
  type        = string
  default     = ""
  description = "Set public zone id"
}

variable private_zone_id {
  type        = string
  default     = ""
  description = "Set private zone id"
}

variable public_records {
  type    = list(map(any))
  default = []
}

variable private_records {
  type    = list(map(any))
  default = []
}