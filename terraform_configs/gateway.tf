# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.application.id
  depends_on = [ aws_vpc.application ]
  tags = {
    Name = "Main IGW"
  }
}