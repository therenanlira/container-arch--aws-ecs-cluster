resource "aws_service_discovery_private_dns_namespace" "sd_cloudmap" {
  name        = "${var.project_name}.discovery.com"
  description = "Service Discovery for ${var.project_name}"

  vpc = data.aws_ssm_parameter.vpc_id.value

  tags = {
    Name     = "${var.project_name}.discovery.com"
    Resource = "service-discovery-namespace"
  }
}
