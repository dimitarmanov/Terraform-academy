# aws_lb
resource "aws_lb" "lb-nginx" {
    name = "dma-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.alb_sg.id]
    subnets            = [aws_subnet.subnet1,aws_subnet.subnet2]

    tags = local.common_tags
}
# aws_lb_target_group

resource "aws_lb_target_group" "lb_nginx_tg" {
    name     = "dma-lb-nginx-tg"
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.vpc.id
  
    tags = local.common_tags
}

# aws_lb_listener

resource "aws_lb_listener" "nginx-lbl" {
  load_balancer_arn = aws_lb.lb-nginx.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_nginx_tg.arn
}
    tags = local.common_tags

}

# aws_lb_target_group_attachment

resource "aws_lb_target_group_attachment" "nginx1" {
  target_group_arn = aws_lb_target_group.lb_nginx_tg.arn
  target_id        = aws_instance.nginx1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "nginx2" {
  target_group_arn = aws_lb_target_group.lb_nginx_tg.arn
  target_id        = aws_instance.nginx2.id
  port             = 80
}