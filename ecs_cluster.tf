resource "aws_ecs_cluster" "main" {
  name = "${local.workspace.project_name}--ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    Name = "${local.workspace.project_name}--ecs-cluster"
  }
}
