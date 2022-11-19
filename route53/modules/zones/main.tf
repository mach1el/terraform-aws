resource "aws_route53_zone" "public" {
  name = var.domain_name
}

resource "aws_route53_zone" "private" {
  name = var.domain_name
  dynamic "vpc" {
    for_each = { for k,v in var.vpc_ids: k => v if v.vpc_id != null }
    content {
      vpc_id     = vpc.value.vpc_id
      vpc_region = lookup(vpc.value,"vpc_region",var.default_vpc_region)
    }
  }
}