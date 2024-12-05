variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "ami_id" {}
variable "instance_type" {
  default = "t3.micro"
}

variable "bucket_name" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}

variable "ingress_ports" {
  type = list(number)
  default = [22, 80, 443]
}
