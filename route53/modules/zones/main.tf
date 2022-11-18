resource "aws_route53_zone" "public" {
  name = var.domain_name
}

resource "aws_route53_zone" "private" {
  name = var.domain_name
  dynamic "vpc" {
    for_each = var.vpc_ids
    content {
      vpc_id     = vpc.value["vpc_id"]
      vpc_region = vpc.value["vpc_region"]
    }
  }
}