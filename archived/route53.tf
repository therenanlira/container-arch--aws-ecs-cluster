resource "aws_route53_zone" "private" {
  name = "${var.project_name}.internal.com"

  vpc {
    vpc_id = data.aws_vpc.selected.id
  }
}

resource "aws_route53_record" "wildcard" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "*.${var.project_name}.internal.com"
  type    = "A"

  alias {
    name                   = aws_lb.load_balancer_internal.dns_name
    zone_id                = aws_lb.load_balancer_internal.zone_id
    evaluate_target_health = true
  }
}
