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

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = [
    for cp in aws_ecs_capacity_provider.these : cp.name
  ]

  dynamic "default_capacity_provider_strategy" {
    for_each = contains(toset(local.workspace.capacity_provider_strategy), "on_demand") ? [0] : []
    content {
      capacity_provider = aws_ecs_capacity_provider.these["on_demand"].name
      weight            = 100
      base              = 0
    }
  }
}
