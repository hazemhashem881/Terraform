resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "TerraformPublicRT"
  }
}