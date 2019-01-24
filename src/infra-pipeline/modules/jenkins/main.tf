data "template_file" "aws_jenkins-userdata" {
  template = "${file("${path.module}/files/userdata_jenkins.sh")}"
}

resource "aws_security_group" "aws_security_group_jenkins" {
  name = "jenkins-security-group"
  description = "Jenkins Security Group"
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
    Name  = "${var.product_code}-${var.env}-jenkins-${count.index}"
    env   = "${var.env}"
  }
}

resource "aws_instance" "aws_ec2_instance_jenkins" {
  count = "${var.count}"
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  key_name = "${var.ami_key_pair_name}"
  subnet_id = "${var.aws_public_subnet}"
  security_groups = ["${aws_security_group.aws_security_group_jenkins.id}"]
  associate_public_ip_address = "true"
  user_data = "${data.template_file.aws_jenkins-userdata.rendered}"
  tags {
    Name  = "${var.product_code}-${var.env}-jenkins-${count.index}"
    env   = "${var.env}"
  }
}
