module "aws_dev_infra" {
 source = "../modules/network",

 aws_region = "${var.aws_region}"
 product_code = "${var.product_code}"
 env = "${var.env}"
 vpc_cidr = "${var.vpc_cidr}"
 public_subnet_cidr = "${var.public_subnet_cidr}"
 private_subnet_cidr = "${var.private_subnet_cidr}"
 route_table_cidr = "${var.route_table_cidr}"
 public_az = "${var.public_az}"
 private_az = "${var.private_az}"
}

module "aws_dev_jenkins" {
 source = "../modules/jenkins",

 aws_region = "${var.aws_region}"
 product_code = "${var.product_code}"
 env = "${var.env}"
 count = "${var.count}"
 instance_type = "${var.instance_type}"
 ami_id = "${var.ami_id}"
 ami_key_pair_name = "${var.ami_key_pair_name}"
 aws_public_subnet = "${module.aws_dev_infra.aws_infra["public_subnet_id"]}"
 aws_vpc_id = "${module.aws_dev_infra.aws_infra["vpc_id"]}"
}

module "aws_dev_appserver" {
 source = "../modules/appserver",

 aws_region = "${var.aws_region}"
 product_code = "${var.product_code}"
 env = "${var.env}"
 count = "${var.count}"
 instance_type = "${var.instance_type}"
 ami_id = "${var.ami_id}"
 ami_key_pair_name = "${var.ami_key_pair_name}"
 aws_private_subnet = "${module.aws_dev_infra.aws_infra["private_subnet_id"]}"
 aws_vpc_id = "${module.aws_dev_infra.aws_infra["vpc_id"]}"
 dummy = "${module.aws_dev_infra.aws_infra["nat_route_id"]}"
}
