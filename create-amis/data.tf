data "aws_instance" "source_instance" {
  for_each    = toset(var.ec2_ids)
  instance_id = each.key
}