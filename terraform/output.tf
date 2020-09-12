output "public_ip_worker" {
  value = module.compute_instance.public_ip_worker
}

output "public_ip_manager" {
  value = module.compute_instance.public_ip_manager
}
