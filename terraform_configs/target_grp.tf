# Target Group for Public Instances
resource "aws_lb_target_group" "public_tg" {
  name     = "public-target-group"
  port     = 80
  protocol = "HTTP"
  
  vpc_id   = aws_vpc.application.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    protocol            = "HTTP"
    port                = "80"
  }

  tags = {
    Name = "Public Target Group"
  }
}

# Target Group for Private Instances
resource "aws_lb_target_group" "private_tg" {
  name     = "private-target-group"
  port     = 8080
  protocol = "HTTP"

  vpc_id   = aws_vpc.application.id


#   health_check {
#     path                = "/api" # Adjust this based on your application
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     protocol            = "HTTP"
#     port                = "8080"
#   }

  tags = {
    Name = "Private Target Group"
  }
}