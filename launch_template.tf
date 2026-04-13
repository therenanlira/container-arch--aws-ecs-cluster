resource "aws_launch_template" "these" {
  for_each = toset(local.workspace.capacity_provider_strategies)

  name_prefix = "${local.workspace.project_name}--${replace(each.value, "_", "-")}--lt"

  image_id               = local.workspace.ecs_ami
  instance_type          = local.workspace.ecs_instance_type
  update_default_version = true

  vpc_security_group_ids = [
    aws_security_group.ecs_cluster.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_role.name
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = local.workspace.ecs_volume_size
      volume_type = local.workspace.ecs_volume_type
    }
  }

  dynamic "instance_market_options" {
    for_each = contains(toset(local.workspace.capacity_provider_strategies), "spot") ? [0] : []
    content {
      market_type = "spot"
      spot_options {
        max_price = "0.15"
      }
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${local.workspace.project_name}--${replace(each.value, "_", "-")}--lt"
    }
  }

  user_data = base64encode(templatefile("${path.module}/templates/user-data.tpl", {
    ECS_CLUSTER = aws_ecs_cluster.main.name
  }))
}
