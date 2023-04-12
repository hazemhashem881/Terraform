#----- private route table
resource "aws_default_route_table" "private" {
  default_route_table_id = aws_vpc.myvpc.default_route_table_id

  tags = {
    Name = "${var.WS}_rdefault_route_private"
  }
}

#---------private route
resource "aws_route" "RT-prive" {
  route_table_id = aws_default_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.NGW.id
}


resource "aws_route_table_association" "assoprivate1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route.RT-prive.id
}
resource "aws_route_table_association" "assoprivate2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route.RT-prive.id

}