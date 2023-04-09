resource "aws_instance" "pubEC2" {
  ami                     = "ami-06e46074ae430fba6"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public-subnet-1.id
  key_name = "ec2"
  security_groups = [aws_security_group.secgroup.id]
  tags = {
    Name ="TerrafromPubec2"
  }
}


# Private ec
resource "aws_instance" "PrivateEC2" {
  ami                     = "ami-06e46074ae430fba6"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.private-subnet-1.id
  key_name = "ec2"
  security_groups = [aws_security_group.secgroup.id]
  tags = {
    Name ="Terrafromprivate2"
  }
}