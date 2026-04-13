module "ecs_cluster" {
  source = "../container-arch--aws-ecs-module/ecs_cluster"

  project_name = local.workspace.project_name
  environment  = local.workspace.environment
  network_conf = data.terraform_remote_state.aws_vpc.outputs

  capacity_provider_strategies = local.workspace.capacity_provider_strategies
  ecs_autoscaling              = local.workspace.ecs_autoscaling
  ecs_ami                      = local.workspace.ecs_ami
  ecs_instance_type            = local.workspace.ecs_instance_type

  ecs_volume_size = local.workspace.ecs_volume_size
  ecs_volume_type = local.workspace.ecs_volume_type

  load_balancer_internal = local.workspace.load_balancer_internal
  load_balancer_type     = local.workspace.load_balancer_type

  user_data_template = "${path.module}/templates/user-data.tpl"
}
