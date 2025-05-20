output "nginx_url" {
  description = "The DNS name of the load balancer"
  value       = module.ecs.lb_dns_name
}
