#----- create routes 
resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.myvpc.default_route_table_id

  tags = {
    Name = "default_route_public"
  }
}



# ------- public route
resource "aws_route" "public_IG_route" {
  route_table_id            = aws_default_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id

  timeouts{
    create = "5m"
  }
}

#---------private route
resource "aws_route" "private_nat_gateway" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.demo_ngw.id
  timeouts{
    create = "5m"
  }
}