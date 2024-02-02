resource "aws_instance" "ec2" {
  availability_zone      = var.az
  subnet_id              = var.sub_id
  ami                    = var.ami_id
  key_name               = var.ssh_key
  instance_type          = var.type
  vpc_security_group_ids = var.sg_ids

  tags = {
    Name = var.name
  }
}
