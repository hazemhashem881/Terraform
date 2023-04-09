resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "TerraformPrivateSubnet-1"
  }
}

# Second private subnet 
resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "TerraformPrivateSubnet-2"
  }
}