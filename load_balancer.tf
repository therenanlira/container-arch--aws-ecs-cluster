########################################
########### Security Group
########################################

resource "aws_security_group" "load_balancer" {
  name = "${local.workspace.project_name}--lb-sg"

  vpc_id = data.terraform_remote_state.aws_vpc.outputs.id

  tags = {
    Name = "${local.workspace.project_name}--lb-sg"
  }
}

resource "aws_vpc_security_group_egress_rule" "load_balancer_outbound_all" {
  security_group_id = aws_security_group.load_balancer.id

  from_port   = 0
  to_port     = 0
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"

  tags = {
    Name = "${local.workspace.project_name}--lb-sg outbound all"
  }
}

resource "aws_vpc_security_group_ingress_rule" "load_balancer_inbound_http" {
  security_group_id = aws_security_group.load_balancer.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"

  tags = {
    Name = "${local.workspace.project_name}--lb-sg inbound http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "load_balancer_inbound_https" {
  security_group_id = aws_security_group.load_balancer.id

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"

  tags = {
    Name = "${local.workspace.project_name}--lb-sg inbound https"
  }
}

########################################
########### Load Balancer
########################################

resource "aws_lb" "main" {
  name = "${local.workspace.project_name}--lb"

  internal           = local.workspace.load_balancer_internal
  load_balancer_type = local.workspace.load_balancer_type

  subnets         = [for sub in data.terraform_remote_state.aws_vpc.outputs.public_subnet_ids : sub]
  security_groups = [aws_security_group.load_balancer.id]

  enable_cross_zone_load_balancing = false
  enable_deletion_protection       = false
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn

  port     = "80"
  protocol = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Container Arch"
      status_code  = "200"
    }
  }
}
