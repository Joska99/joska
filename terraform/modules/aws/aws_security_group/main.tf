resource "aws_security_group" "allow_ssh" {
  name        = var.name
  description = "Allow ssh/http/https inbound traffic"

  dynamic "ingress" {
    for_each = var.rules_for_sg
    iterator = rule
    content {
      description = rule.value.description
      from_port   = rule.value.port
      to_port     = rule.value.port
      protocol    = rule.value.protocol
      cidr_blocks = rule.value.ips
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
