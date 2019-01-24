output "jenkins_infra" {
  description = "Jenkins Infra"
  value = "${
    map(
    "instance_name", "${aws_instance.aws_ec2_instance_jenkins.*.id}",
    "public_ip", "${aws_instance.aws_ec2_instance_jenkins.*.public_ip}"
    )
  }"
}
