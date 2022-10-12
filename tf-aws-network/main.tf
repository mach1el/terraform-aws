resource "aws_vpc" "new_vpc" {
  cidr_block       = var.vpc_cdir_block
  instance_tenancy = "default"
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "${var.tag_name} IGW"
  }
}

resource "aws_eip" "pubIP" {
  vpc = true
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = var.priv_subnet_cdir_block
  tags = {
    Name = "${var.tag_name} Private"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = var.publ_subnet_cdir_block
  tags = {
    Name = "${var.tag_name} Public"
  }
}

resource "aws_nat_gateway" "NATgw" {
  allocation_id = aws_eip.pubIP.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_route_table" "PublicRT" {
  vpc_id =  aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.tag_name} Public"
  }
}

resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw.id
  }
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_route_table_association" "PublicRTassociation" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table_association" "PrivateRTassociation" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.PrivateRT.id
}