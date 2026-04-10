data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_ssm_parameter" "vpc_id" {
  name = local.workspace.ssm_vpc_id
}

data "aws_ssm_parameter" "public_subnet_ids" {
  for_each = local.workspace.ssm_public_subnet_ids
  name     = each.value
}

data "aws_ssm_parameter" "private_subnet_ids" {
  for_each = local.workspace.ssm_private_subnet_ids
  name     = each.value
}

data "aws_ssm_parameter" "data_subnet_ids" {
  for_each = local.workspace.ssm_data_subnet_ids
  name     = each.value
}
