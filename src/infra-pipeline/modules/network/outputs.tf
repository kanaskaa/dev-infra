output "aws_infra" {
  description = "AWS infra network"
  value = "${
    map(
      "vpc_id", "${aws_vpc.aws_vpc_infra.id}",
      "public_subnet_id", "${aws_subnet.aws_subnet_infra-public-subnet.id}",
      "private_subnet_id", "${aws_subnet.aws_subnet_infra-private-subnet.id}",
      "nat_route_id", "${aws_route.aws_route_infra-private-nat-gateway-route.id}"
    )
    }"
  }
