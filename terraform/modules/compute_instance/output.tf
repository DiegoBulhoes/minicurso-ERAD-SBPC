output "public_ip_worker" {
  value = google_compute_instance.worker.*.network_interface.0.access_config.0.nat_ip
}
output "public_ip_manager" {
  value = google_compute_instance.manager.*.network_interface.0.access_config.0.nat_ip
}
