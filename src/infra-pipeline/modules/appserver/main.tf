data "template_file" "aws_appserver-userdata" {
  template = "${file("${path.module}/files/userdata_appserver.sh")}"
}

resource "aws_security_group" "aws_security_group_appserver" {
  name = "app-security-group"
  description = "Appserver Security Group"
  vpc_id = "${var.aws_vpc_id}"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name  = "${var.product_code}-${var.env}-appserver-${count.index}"
    env   = "${var.env}"
  }
}

resource "aws_instance" "aws_ec2_instance_appserver" {
  count = "${var.count}"
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  key_name = "${var.ami_key_pair_name}"
  subnet_id = "${var.aws_private_subnet}"
  security_groups = ["${aws_security_group.aws_security_group_appserver.id}"]
  associate_public_ip_address = "false"
  user_data = "${data.template_file.aws_appserver-userdata.rendered}"
  tags {
    Name  = "${var.product_code}-${var.env}-appserver-${count.index}"
    env   = "${var.env}"
  }
}
