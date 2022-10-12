resource "aws_security_group" "sg" {
  for_each    = {for data in local.security_groups: data.name => data}
  name        = each.value.name
  description = each.value.name
  vpc_id      = "${var.vpc_id}"
  tags        = {
    Name = each.value.name
  }

  dynamic "ingress" {
    for_each = each.value.ingress
    content {
    from_port   = ingress.value.from
    to_port     = ingress.value.to
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
    description = ingress.value.description
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}