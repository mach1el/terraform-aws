output public_zone {
  value = aws_route53_zone.public.id
}

output private_zone {
  value = aws_route53_zone.private.id
}