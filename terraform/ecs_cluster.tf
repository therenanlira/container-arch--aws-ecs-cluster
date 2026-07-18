module "ecs_cluster" {
  source = "git::https://github.com/therenanlira/container-arch--aws-ecs-module.git//ecs_cluster?ref=v1"

  project_name   = local.workspace.project_name
  environment    = local.workspace.environment
  network_values = data.terraform_remote_state.aws_vpc.outputs

  capacity_provider_strategies = local.workspace.capacity_provider_strategies
  ecs_autoscaling              = local.workspace.ecs_autoscaling
  ecs_ami                      = local.workspace.ecs_ami[local.workspace.aws_region]
  ecs_instance_type            = local.workspace.ecs_instance_type

  ecs_volume_size = local.workspace.ecs_volume_size
  ecs_volume_type = local.workspace.ecs_volume_type

  load_balancer_internal = local.workspace.load_balancer_internal
  load_balancer_type     = local.workspace.load_balancer_type

  user_data_template = "${path.module}/templates/user-data.tpl"
}
