#------create aws ec2 ---

resource "aws_instance" "pubEC2" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id = module.network.public_subnet_id
  key_name = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.terra_sq.id]
  tags = {
    Name ="TerrafromPubec1"
  }
  root_block_device {
    delete_on_termination = true
  }
}


# Private ec2
resource "aws_instance" "PrivateEC2" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id = module.network.private_subnet_id
  key_name = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.terra_sq.id]
  tags = {
    Name ="Terrafromprivate1"
  }
  root_block_device {
    delete_on_termination = true
  }
}