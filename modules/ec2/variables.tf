variable "ami_id" {}
variable "instance_type" {}
variable "subnet_ids" {}
variable "security_group_ids" {
  type = list(string)
}
