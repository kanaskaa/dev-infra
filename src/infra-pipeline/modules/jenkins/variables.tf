variable "product_code" {
  description = "Product code"
}
variable "env" {
  description = "Environment e.g. dev,preprod,prod"
}
variable "aws_region" {
  description = "Region in which to create network"
}
variable "count" {
  description = "No of ec2 instances"
}
variable "instance_type" {
  description = "ec2 instance type"
}
variable "ami_id" {
  description = "ami id for ec2 instances"
}
variable "ami_key_pair_name" {
  description = "key pair to ssh into ec2 instances"
}
variable "aws_public_subnet" {
  description = "public subnet for ec2 instances"
}
variable "aws_vpc_id" {
  description = "vpc for security group"
}
