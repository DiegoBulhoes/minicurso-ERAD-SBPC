
output "vpc_network" {
  description = "VPC network"
  value       = google_compute_network.vpc_network.self_link
}
