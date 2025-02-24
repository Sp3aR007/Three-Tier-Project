# ALB Listener for HTTP Traffic (Port:80)
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_tg.arn # Forward to public target group
  }
}

# Target Group Attachment for Public Instances (Port:80)
resource "aws_lb_target_group_attachment" "public_attachment" {
  count              = length(aws_instance.frontend_instances)
  
  target_group_arn   = aws_lb_target_group.public_tg.arn
  target_id          = aws_instance.frontend_instances[count.index].id
}

# ALB Listener for HTTP Traffic (Port:8080)
resource "aws_lb_listener" "backend_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_tg.arn # Forward to public target group
  }
}

# Target Group Attachment for Private Instances (Port:8080)
resource "aws_lb_target_group_attachment" "private_attachment" {
  count              = length(aws_instance.backend_instances)

  target_group_arn   = aws_lb_target_group.private_tg.arn
  target_id          = aws_instance.backend_instances[count.index].id
}