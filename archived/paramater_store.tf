resource "aws_ssm_parameter" "load_balancer_external_arn" {
  name  = "${var.project_name}--lb-ext-arn"
  type  = "String"
  value = aws_lb.load_balancer_external.arn

  tags = {
    Name     = "${var.project_name}--lb-ext--arn"
    Resource = "ssm-parameter"
  }
}

resource "aws_ssm_parameter" "load_balancer_external_http_listener_arn" {
  name  = "${var.project_name}--lb-ext-http-listener-arn"
  type  = "String"
  value = aws_lb_listener.load_balancer_external_http_listener.arn

  tags = {
    Name     = "${var.project_name}--lb-ext-http-listener-arn"
    Resource = "ssm-parameter"
  }
}

resource "aws_ssm_parameter" "load_balancer_internal_arn" {
  name  = "${var.project_name}--lb-int-arn"
  type  = "String"
  value = aws_lb.load_balancer_internal.arn

  tags = {
    Name     = "${var.project_name}--lb-int-arn"
    Resource = "ssm-parameter"
  }
}

resource "aws_ssm_parameter" "load_balancer_internal_http_listener_arn" {
  name  = "${var.project_name}--lb-int-http-listener-arn"
  type  = "String"
  value = aws_lb_listener.load_balancer_internal_http_listener.arn

  tags = {
    Name     = "${var.project_name}--lb-int-http-listener-arn"
    Resource = "ssm-parameter"
  }
}

resource "aws_ssm_parameter" "sd_cloudmap_id" {
  name  = "${var.project_name}--sd-namespace-id"
  type  = "String"
  value = aws_service_discovery_private_dns_namespace.sd_cloudmap.id
}
