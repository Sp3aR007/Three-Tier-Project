# EC2 Instances in Public Subnets
resource "aws_instance" "frontend_instances" {
  count         = 1
  ami           = "ami-04b4f1a9cf54c11d0" # Replace with your desired AMI ID
  instance_type = "t2.large"
  
  subnet_id     = aws_subnet.public_subnets[count.index].id
  key_name      = "rahul" # Replace with your existing SSH key name
  vpc_security_group_ids = [aws_security_group.public_sg.id] # Associate the security group
  tags = {
    Name = "Public Instance ${count.index + 1}"
  }
}

# EC2 Instances in Private Subnets
resource "aws_instance" "backend_instances" {
  count         = 1
  ami           = "ami-04b4f1a9cf54c11d0" # Replace with your desired AMI ID
  instance_type = "t2.micro"

  subnet_id     = aws_subnet.private_subnets[count.index].id
  key_name      = "rahul" # SSH key name
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  tags = {
    Name = "Private Instance ${count.index + 1}"
  }
}