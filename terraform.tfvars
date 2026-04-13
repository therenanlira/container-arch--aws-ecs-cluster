workspaces = {
  dev = {
    allowed_accounts = ["923672208632"]
    environment      = "dev"
    aws_region       = "us-east-1"

    project_name = "container-arch"

    ssm_public_subnet_ids = {
      "us-east-1a" = "/container-arch/dev/us-east-1a/public_subnet_ids"
      "us-east-1b" = "/container-arch/dev/us-east-1b/public_subnet_ids"
      "us-east-1c" = "/container-arch/dev/us-east-1c/public_subnet_ids"
    }
    ssm_private_subnet_ids = {
      "us-east-1a" = "/container-arch/dev/us-east-1a/private_subnet_ids"
      "us-east-1b" = "/container-arch/dev/us-east-1b/private_subnet_ids"
      "us-east-1c" = "/container-arch/dev/us-east-1c/private_subnet_ids"
    }
    ssm_data_subnet_ids = {
      "us-east-1a" = "/container-arch/dev/us-east-1a/data_subnet_ids"
      "us-east-1b" = "/container-arch/dev/us-east-1b/data_subnet_ids"
      "us-east-1c" = "/container-arch/dev/us-east-1c/data_subnet_ids"
    }

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
