output "vpc_id" {
  value = aws_vpc.new_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.*.id
}

output "private_ip_range" {
  value = aws_subnet.private_subnet.*.cidr_block
}

output "public_ip_range" {
  value = aws_subnet.public_subnet.*.cidr_block
}

output "private_RT_id" {
  value = aws_route_table.PrivateRT.*.id
}

output "public_RT_id" {
  value = aws_route_table.PublicRT.*.id
}