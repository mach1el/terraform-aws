data "aws_instance" "source_instance" {
  for_each    = local.source_ids
  instance_id = each.key
}