output "instance_ip" {
  value = tomap({
    for s in aws_instance.new: s.tags["Name"] => s.private_ip
  })
}