variable "ami_id" {}
variable "instance_type" {}
variable "subnet_ids" {
  description = "List of subnet IDs where EC2 instances will be launched"
  type        = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
