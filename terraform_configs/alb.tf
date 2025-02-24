# Application Load Balancer
resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  
  security_groups = [aws_security_group.alb_sg.id]
  
  subnets = [
    aws_subnet.public_subnets[0].id,
    aws_subnet.public_subnets[1].id,
  ]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
    Name        = "My ALB"
  }
}