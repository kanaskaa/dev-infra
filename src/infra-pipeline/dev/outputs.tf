output "dev_aws_infra" {
  description = "DEV AWS infra network"
  value = "${
    map(
    "vpc_id", "${module.aws_dev_infra.aws_infra["vpc_id"]}",
    "public_subnet_id", "${module.aws_dev_infra.aws_infra["public_subnet_id"]}",
    "private_subnet_id", "${module.aws_dev_infra.aws_infra["private_subnet_id"]}"
    )
  }"
}
output "dev_aws_jenkins.*" {
  description = "Jenkins AWS infra"
  value = "${
    map(
    "jenkins_instance_name", "${module.aws_dev_jenkins.jenkins_infra["instance_name"]}",
    "jenkins_public_ip", "${module.aws_dev_jenkins.jenkins_infra["public_ip"]}"
    )
  }"
}
output "dev_aws_appserver.*" {
  description = "Appserver AWS infra"
  value = "${
    map(
    "appserver_instance_name", "${module.aws_dev_appserver.appserver_infra["instance_name"]}"
    )
  }"
}
