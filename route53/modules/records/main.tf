resource "aws_route53_record" "public_records" {
  for_each = { for record in var.public_records: record.name => record}
  zone_id  = "${var.public_zone_id != "" ? var.public_zone_id : false}"
  name     = each.value.name
  type     = each.value.type
  ttl      = each.value.ttl
  records  = try(each.value.records,false)
}

resource "aws_route53_record" "private_records" {
  for_each = { for record in var.private_records: record.name => record}
  zone_id  = "${var.private_zone_id != "" ? var.private_zone_id : false}"
  name     = each.value.name
  type     = each.value.type
  ttl      = each.value.ttl
  records  = try(each.value.records,false)
}