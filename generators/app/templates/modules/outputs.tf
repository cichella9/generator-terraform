# Your module outputs goes here
# output "instance_ip_addr" {
#   value       = aws_instance.server.private_ip
#   description = "The private IP address of the main server instance."
#   sensitive   = true
# 
#   depends_on = [
#     # Security group rule must be created before this IP address could
#     # actually be used, otherwise the services will be unreachable.
#     aws_security_group_rule.local_access,
#   ]
# }