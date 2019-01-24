output "appserver_infra" {
  description = "Appserver Infra"
  value = "${
    map(
    "instance_name", "${aws_instance.aws_ec2_instance_appserver.*.id}"
    )
  }"
}
