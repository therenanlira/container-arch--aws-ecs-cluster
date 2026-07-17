workspaces = {
  dev = {
    allowed_accounts = ["150100906110"]
    environment      = "dev"
    aws_region       = "us-east-2"

    project_name = "container-arch"

    capacity_provider_strategies = ["on_demand", "spot"]

    ecs_instance_type = "t3.small"
    ecs_volume_size   = "50"
    ecs_volume_type   = "gp3"

    ecs_ami = {
      us-east-1 = "ami-01edba92f9036f76e"
      us-east-2 = "ami-04ea4e8270c27626c"
    }

    ecs_autoscaling = {
      on_demand = {
        minimum = "2"
        maximum = "3"
        desired = "3"
      }
      spot = {
        minimum = "2"
        maximum = "3"
        desired = "3"
      }
    }

    load_balancer_internal = false
    load_balancer_type     = "application"
  }
}
