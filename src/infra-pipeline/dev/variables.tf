variable "product_code" {
  description = "Product code"
}
variable "env" {
  description = "Environment e.g. dev,preprod,prod"
}
variable "aws_region" {
  description = "Region in which to create network"
}
variable "vpc_cidr" {
  description = "vpc cidr "
}
variable "public_subnet_cidr" {
  description = "public subnet cidr"
}
variable "private_subnet_cidr" {
  description = "private subnet cidr"
}
variable "route_table_cidr" {
  description = "route table cidr"
}
variable "public_az" {
  description = "public subnet availabilty zone"
}
variable "private_az" {
  description = "public subnet availabilty zone"
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
