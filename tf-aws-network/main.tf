resource "aws_vpc" "new_vpc" {
  cidr_block       = var.vpc_cdir_block
  instance_tenancy = "default"
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  count = var.create_igw ? 1 : 0
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "${var.tag_name} IGW"
  }
}

resource "aws_eip" "pubIP" {
  count = var.create_eip ? 1 : 0
  vpc   = true
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_subnet" "private_subnet" {
  count      = var.create_priv_subnet == true ? 1 : 0
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = var.priv_subnet_cdir_block
  tags = {
    Name = "${var.tag_name} Private"
  }
}

resource "aws_subnet" "public_subnet" {
  count      = var.create_publ_subnet == true ? 1 : 0
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = var.publ_subnet_cdir_block
  tags = {
    Name = "${var.tag_name} Public"
  }
}

resource "aws_nat_gateway" "NATgw" {
  count         = var.create_nat_gw == true ? 1 : 0
  allocation_id = aws_eip.pubIP.*.id
  subnet_id     = aws_subnet.public_subnet.*.id
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_route_table" "PublicRT" {
  count  = var.create_publRT == true ? 1 : 0
  vpc_id =  aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw[0].id
  }
  tags = {
    Name = "${var.tag_name} Public"
  }
}

resource "aws_route_table" "PrivateRT" {
  count  = var.create_privRT == true ? 1 : 0
  vpc_id = aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw.*.id
  }
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_route_table_association" "PublicRTassociation" {
  count          = var.create_publRT == true ? 1 : 0
  subnet_id      = aws_subnet.public_subnet[0].id
  route_table_id = aws_route_table.PublicRT[0].id
}

resource "aws_route_table_association" "PrivateRTassociation" {
  count          = var.create_privRT == true ? 1 : 0
  subnet_id      = aws_subnet.private_subnet[0].id
  route_table_id = aws_route_table.PrivateRT[0].id
}