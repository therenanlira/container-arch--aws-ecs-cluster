output "lb_dns" {
  value = aws_lb.main.arn
}

output "ssm_lb_dns" {
  value = aws_ssm_parameter.lb_arn.id
}

output "ssm_lb_listener" {
  value = aws_ssm_parameter.lb_listener.id
}
