resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, 0)
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "AppInstance"
  }
}
