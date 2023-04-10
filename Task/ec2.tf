#------create aws ec2 ---

resource "aws_instance" "pubEC2" {
  ami                     = "ami-06e46074ae430fba6"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public-subnet-1.id
  key_name = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.secgroup.id]
  tags = {
    Name ="TerrafromPubec1"
  }
  root_block_device {
    delete_on_termination = true
  }
}


# Private ec2
resource "aws_instance" "PrivateEC2" {
  ami                     = "ami-06e46074ae430fba6"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.private-subnet-1.id
  key_name = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.secgroup.id]
  tags = {
    Name ="Terrafromprivate1"
  }
  root_block_device {
    delete_on_termination = true
  }
}