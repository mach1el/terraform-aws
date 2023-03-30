output vpc_id {
  value = aws_vpc.new_vpc.id
}

output public_subnet_ids {
  value = var.create_public_subnet ? aws_subnet.public_subnet.*.id : []
}

output private_subnet_ids {
  value = var.create_private_subnet ? aws_subnet.private_subnet.*.id : []
}

output public_route_table_id {
  value = var.create_public_subnet ? aws_route_table.PublicRT.*.id : []
}

output private_route_table_id {
  value = var.create_private_subnet ? aws_route_table.PrivateRT.*.id : []
}