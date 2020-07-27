
output "manager-ip-public" {
  value = {
    for instance in google_compute_instance.manager :
    instance.name => instance.network_interface.0.access_config.0.nat_ip
  }
}

output "manager-ip-private" {
  value = {
    for instance in google_compute_instance.manager :
    instance.name => instance.network_interface.0.network_ip
  }
}

output "worker-ip-public" {
  value = {
    for instance in google_compute_instance.worker :
    instance.name => instance.network_interface.0.access_config.0.nat_ip
  }
}

output "worker-ip-private" {
  value = {
    for instance in google_compute_instance.worker :
    instance.name => instance.network_interface.0.network_ip
  }
}
