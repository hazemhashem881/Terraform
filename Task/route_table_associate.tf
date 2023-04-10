resource "aws_route_table_association" "publicSubnetAssoc-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_default_route_table.public.id
}

resource "aws_route_table_association" "publicSubnetAssoc-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_default_route_table.public.id
}



#----- private route table

resource "aws_route_table" "private"{
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Private-route"
  }
}


resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private.id

}