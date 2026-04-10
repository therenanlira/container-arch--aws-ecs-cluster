resource "aws_security_group" "ecs_cluster" {
  name = "${local.workspace.project_name}--ecs-sg"

  vpc_id = data.aws_ssm_parameter.vpc_id.value

  tags = {
    Name = "${local.workspace.project_name}--ecs-sg"
  }
}

resource "aws_vpc_security_group_egress_rule" "ecs_cluster_outbound_all" {
  security_group_id = aws_security_group.ecs_cluster.id

  from_port   = 0
  to_port     = 0
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"

  tags = {
    Name = "${local.workspace.project_name}--ecs-sg outbound all"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecs_cluster_inbound_all_vpc" {
  security_group_id = aws_security_group.ecs_cluster.id

  ip_protocol = "-1"
  cidr_ipv4   = data.aws_vpc.vpc_cidr.cidr_block

  tags = {
    Name = "${local.workspace.project_name}--ecs-sg inbound all from VPC"
  }
}
