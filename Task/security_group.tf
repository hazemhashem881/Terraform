resource "aws_security_group" "secgroup" {
  name        = "secgroup"
  description = "Allow Http  traffic from anywhere"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraformSecuritygroup"
  }
}