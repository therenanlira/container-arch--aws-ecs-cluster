workspaces = {
  dev = {
    allowed_accounts = ["923672208632"]
    environment      = "dev"
    aws_region       = "us-east-1"

    project_name = "container-arch"

    ssm_vpc_id = "/container-arch/dev/vpc_id"
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
  }
}
