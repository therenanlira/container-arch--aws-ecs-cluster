workspaces = {
  dev = {
    allowed_accounts = ["923672208632"]
    environment      = "dev"
    aws_region       = "us-east-1"

    project_name = "container-arch"

    load_balancer_internal = false
    load_balancer_type     = "application"

    ecs_ami           = "ami-0d4c2549219f5d7f6"
    ecs_instance_type = "t3a.large"
    ecs_volume_size   = "50"
    ecs_volume_type   = "gp3"

    ecs_autoscaling = {
      on_demand = {
        minimum = "2"
        maximum = "4"
        desired = "3"
      }
      spot = {
        minimum = "2"
        maximum = "4"
        desired = "3"
      }
    }

    capacity_provider_strategies = ["on_demand"] # ["on_demand", "spot"]
  }
}
