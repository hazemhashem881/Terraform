resource "aws_eip" "nat_ip" {
  vpc = true
  tags = {
    Name = "demo-eip"
  }
}

resource "aws_nat_gateway" "demo_ngw" {
    allocation_id = aws_eip.nat_ip.id
    subnet_id = aws_subnet.public-subnet-1.id
  tags = {
    Name = "demo-nat.gw"
  }
}