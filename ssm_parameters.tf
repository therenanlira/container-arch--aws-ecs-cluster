resource "aws_ssm_parameter" "lb_arn" {
  name  = "/${local.workspace.project_name}/${local.workspace.environment}/lb_arn"
  type  = "String"
  value = aws_lb.main.arn
}

resource "aws_ssm_parameter" "lb_listener" {
  name  = "/${local.workspace.project_name}/${local.workspace.environment}/lb_listener"
  type  = "String"
  value = aws_lb_listener.main.arn
}
