variable public_zone_id {
  description = "Set public zone id"
}

variable private_zone_id {
  description = "Set private zone id"
}

variable public_records {
  type    = list(map(string))
  default = []
}

variable private_records {
  type    = list(map(string))
  default = []
}