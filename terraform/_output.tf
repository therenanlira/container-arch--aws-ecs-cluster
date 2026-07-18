output "ecs_cluster_name" {
  value = module.ecs_cluster.ecs_cluster_name
}

output "lb_arn" {
  value = module.ecs_cluster.lb_arn
}

output "lb_dns_name" {
  value = module.ecs_cluster.lb_dns_name
}

output "lb_listener_arn" {
  value = module.ecs_cluster.lb_listener_arn
}
