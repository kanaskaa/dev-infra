terraform {
  backend "s3" {
    bucket     = "ee-infra-dev-tfstate"
    region     = "us-east-1"
    key        = "dev/terraform.tfstate"
  }
}
