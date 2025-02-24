resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.application.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id # Route traffic to the NAT Gateway
  }
  depends_on = [ aws_nat_gateway.main ]

  tags = {
    Name = "Private Route Table"
  }
}

# Route Table Association for Private Subnets
resource "aws_route_table_association" "private_assoc" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}