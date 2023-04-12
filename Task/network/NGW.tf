resource "aws_nat_gateway" "NGW" {
    allocation_id = aws_eip.eip1.id
    subnet_id = aws_subnet.public-subnet-1.id
  tags = {
    Name = "${var.WS}_NGW"
  }
}