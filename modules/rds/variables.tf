variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "subnet_ids" {}
variable "security_group_ids" {
  description = "List of security group IDs for the RDS instance"
  type        = list(string)
}
