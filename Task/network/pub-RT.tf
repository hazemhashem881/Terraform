#----- create routes 
resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.myvpc.default_route_table_id

  tags = {
    Name = "${var.WS}_rdefault_route_public"
  }
}



# ------- public route
resource "aws_route" "RT-public" {
  route_table_id            = aws_default_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id

}

resource "aws_route_table_association" "publicSubnetAssoc-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route.RT-public.id
}

resource "aws_route_table_association" "publicSubnetAssoc-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route.RT-public.id
}