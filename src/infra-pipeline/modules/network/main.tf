resource "aws_vpc" "aws_vpc_infra" {
  lifecycle {
    ignore_changes = ["id"]
  }
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name  = "${var.product_code}-${var.env}-vpc"
    env   = "${var.env}"
  }
}

resource "aws_subnet" "aws_subnet_infra-public-subnet" {
  vpc_id = "${aws_vpc.aws_vpc_infra.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.public_az}"

  tags {
    Name  = "${var.product_code}-${var.env}-public-subnet"
    env   = "${var.env}"
  }
}

resource "aws_subnet" "aws_subnet_infra-private-subnet" {
  vpc_id = "${aws_vpc.aws_vpc_infra.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "${var.private_az}"

  tags {
    Name  = "${var.product_code}-${var.env}-private-subnet"
    env   = "${var.env}"
  }
}

resource "aws_internet_gateway" "aws_internet_gateway_infra-ig" {
  vpc_id = "${aws_vpc.aws_vpc_infra.id}"

  tags {
    Name  = "${var.product_code}-${var.env}-vpc-igw"
    env   = "${var.env}"
  }
}

resource "aws_route_table" "aws_route_table_infra-routetable" {
  vpc_id = "${aws_vpc.aws_vpc_infra.id}"

  route {
    cidr_block = "${var.route_table_cidr}"
    gateway_id = "${aws_internet_gateway.aws_internet_gateway_infra-ig.id}"
  }

  tags {
    Name  = "${var.product_code}-${var.env}-public-subnet-routetable"
    env   = "${var.env}"
  }
}

resource "aws_route_table_association" "aws_route_table_infra-public-rt" {
  subnet_id = "${aws_subnet.aws_subnet_infra-public-subnet.id}"
  route_table_id = "${aws_route_table.aws_route_table_infra-routetable.id}"
}
