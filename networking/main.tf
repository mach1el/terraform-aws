resource "aws_vpc" "new_vpc" {
  cidr_block       = "${var.vpc_cdir_block}"
  instance_tenancy = "default"
  tags = {
    Name = "${var.tag}"
  }
}

resource "aws_subnet" "public_subnet" {
  count             = "${var.create_public_subnet}" == true ? "${length(var.private_net)}" : 0
  vpc_id            = "${aws_vpc.new_vpc.id}"
  cidr_block        = "${var.public_net[count.index]}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = merge(
    {
      Name = "${var.tag}-${1+count.index} Public"
    },
    var.public_subnet_tags
  )
}

resource "aws_subnet" "private_subnet" {
  count             = "${var.create_private_subnet}" == true ? "${length(var.private_net)}" : 0
  vpc_id            = "${aws_vpc.new_vpc.id}"
  cidr_block        = "${var.private_net[count.index]}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = merge(
    {
      Name = "${var.tag}-${1+count.index} Private"
    },
    var.private_subnet_tags
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.new_vpc.id}"
  tags = {
    Name = "${var.tag} IGW"
  }
}

resource "aws_eip" "NATpubIP" {
  count = "${var.create_private_subnet}" == true ? 1 : 0
  vpc   = true
  tags = {
    Name = "${var.tag} - NATgw"
  }
}

resource "aws_nat_gateway" "NATgw" {
  count         = "${var.create_private_subnet}" == true ? 1 : 0
  allocation_id = "${aws_eip.NATpubIP[count.index].id}"
  subnet_id     = "${aws_subnet.public_subnet[count.index].id}"
  tags = {
    Name = "${var.tag}-${1+count.index} NATgw"
  }
}

resource "aws_route_table" "PublicRT" {
  count  = "${var.create_public_subnet}" == true ? 1 : 0
  vpc_id =  "${aws_vpc.new_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name = "${var.tag} Public"
  }
}

resource "aws_route_table" "PrivateRT" {
  count  = "${var.create_private_subnet}" == true ? 1 : 0
  vpc_id = "${aws_vpc.new_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.NATgw[0].id}"
  }
  tags = {
    Name = "${var.tag} Private"
  }
}

resource "aws_route_table_association" "PublicRTassociation" {
  count          = "${var.create_public_subnet}" == true ? "${length(aws_subnet.public_subnet)}" : 0
  subnet_id      = "${aws_subnet.public_subnet[count.index].id}"
  route_table_id = "${aws_route_table.PublicRT[0].id}"
}

resource "aws_route_table_association" "PrivateRTassociation" {
  count          = "${var.create_private_subnet}" == true ? "${length(aws_subnet.private_subnet)}" : 0
  subnet_id      = "${aws_subnet.private_subnet[count.index].id}"
  route_table_id = "${aws_route_table.PrivateRT[0].id}"
}