locals {
  lb_internal_resource_name = "${substr(var.load_balancer_internal_type, 0, 1)}lb-int"
}

resource "aws_security_group" "load_balancer_internal_sg" {
  name        = "${var.project_name}--${local.lb_internal_resource_name}--sg"
  description = "Security group for the load balancer"
  vpc_id      = data.aws_vpc.selected.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name     = "${var.project_name}--${local.lb_internal_resource_name}--sg"
    Resource = "lb-sg"
  }
}

resource "aws_security_group_rule" "load_balancer_internal_sg_ingress" {
  description       = "Allow HTTP inbound traffic"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.load_balancer_internal_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_lb" "load_balancer_internal" {
  name               = "${var.project_name}--${local.lb_internal_resource_name}"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer_internal_sg.id]

  subnets = [
    data.aws_ssm_parameter.private_subnet_1a.value,
    data.aws_ssm_parameter.private_subnet_1b.value,
    data.aws_ssm_parameter.private_subnet_1c.value
  ]

  enable_cross_zone_load_balancing = false
  enable_deletion_protection       = false

  tags = {
    Name     = "${var.project_name}--${local.lb_internal_resource_name}"
    Resource = "load-balancer"
  }
}

resource "aws_lb_listener" "load_balancer_internal_http_listener" {
  load_balancer_arn = aws_lb.load_balancer_internal.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "LinuxTips - ECS Cluster"
      status_code  = "200"
    }
  }

  tags = {
    Name     = "${var.project_name}--${local.lb_internal_resource_name}--http-listener"
    Resource = "lb-listener"
  }
}
