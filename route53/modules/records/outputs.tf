output public_records {
  value = { for k, v in aws_route53_record.public_records : k => v.name }
}

output private_records {
  value = { for k, v in aws_route53_record.private_records : k => v.name }
}