# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id    = aws_subnet.public_subnets[0].id # Place NAT Gateway in the first public subnet

  tags = {
    Name = "Main NAT Gateway"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  vpc = true
  tags = {
    Name = "Elastic IP for NAT Gateway"
  }
}