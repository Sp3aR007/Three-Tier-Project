# Security Group for Public Instances
resource "aws_security_group" "public_sg" {
  name        = "public-instance-sg"
  description = "Allow SSH, HTTP, and HTTPS traffic to public instances"
  vpc_id      = aws_vpc.application.id

  ingress {
    from_port   = 22   # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from anywhere
  }

  ingress {
    from_port   = 80   # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from anywhere
  }

  ingress {
    from_port   = 443  # HTTPS
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Instance Security Group"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "private-instance-sg"
  description = "Allow SSH traffic to private instances from public instan"
  vpc_id      = aws_vpc.application.id

  ingress {
    from_port   = 22   # SSH
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.public_sg.id] #Allow access to private instances from public instances
  }  
  ingress {
    from_port   = 80   # backend port
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access to port 8080 from Load balancer
  }
  ingress {
    from_port   = 8080   # backend port
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access to port 8080 from Load balancer
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Private Instance Security Group"
  }
}

# ALB Security Group
resource "aws_security_group" "alb_sg" {
  name        = "alb-security-group"
  description = "Allow HTTP traffic to the ALB"
  vpc_id      = aws_vpc.application.id

  ingress {
    from_port   = 80   # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from anywhere
  }
  ingress {
    from_port   = 8080   # HTTP
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALB Security Group"
  }
}


# Security Group for RDS PostgreSQL
resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow PostgreSQL traffic from private instances"
  vpc_id      = aws_vpc.application.id

  # Ingress rule to allow PostgreSQL traffic from private instances
  ingress {
    from_port   = 5432  # PostgreSQL port
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.private_sg.id] # Only allow traffic from the private instance security group
  }

  # Egress rule to allow all outbound traffic (if needed)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    security_groups = [aws_security_group.private_sg.id]
  }

  tags = {
    Name = "RDS Security Group"
  }
}