output "load_balancer_dns" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

