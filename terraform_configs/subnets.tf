
# Public Subnets
resource "aws_subnet" "public_subnets" {
  count             = 2
  vpc_id            = aws_vpc.application.id
  cidr_block        = "10.0.${count.index + 1}.0/24"
  availability_zone = "us-east-1${count.index == 0 ? "a" : "b"}"
  
  map_public_ip_on_launch = true
  depends_on = [ aws_internet_gateway.main ]
  
  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

# Private Subnets
resource "aws_subnet" "private_subnets" {
  count             = 2
  vpc_id            = aws_vpc.application.id
  cidr_block        = "10.0.${count.index + 10}.0/24"
  availability_zone = "us-east-1${count.index == 0 ? "a" : "b"}"
  map_public_ip_on_launch = false
  depends_on = [ aws_vpc.application ]
  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

# Create a DB subnet group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnets[0].id, aws_subnet.private_subnets[1].id] # Ensure private subnets are used

  tags = {
    Name = "RDS Subnet Group"
  }
}
