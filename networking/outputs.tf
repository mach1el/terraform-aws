output vpc_id {
  value = aws_vpc.new_vpc.id
}

output public_subnets_id {
  value = var.create_public_subnet ? aws_subnet.public_subnet.*.id : []
}

output private_subnets_id {
  value = var.create_private_subnet ? aws_subnet.private_subnet.*.id : []
}

output igw_id {
  value = aws_internet_gateway.igw.id
}

output natgw_id {
  value = aws_nat_gateway.NATgw[0].id
}

output public_route_table_id {
  value = var.create_public_subnet ? aws_route_table.PublicRT.*.id : []
}

output private_route_table_id {
  value = var.create_private_subnet ? aws_route_table.PrivateRT.*.id : []
}