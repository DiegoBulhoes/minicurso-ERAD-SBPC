provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "management_network" {
  source                    = "./modules/management_network"
  project                   = var.project
  zone                      = var.zone
  region                    = var.region
  ip_cidr_range_private     = var.ip_cidr_range_private
  ip_cidr_range_public      = var.ip_cidr_range_public
  pub_net_firewall_port_UDP = var.pub_net_firewall_port_UDP
  pub_net_firewall_port_TCP = var.pub_net_firewall_port_TCP
  pvt_net_firewall_port_UDP = var.pvt_net_firewall_port_UDP
  pvt_net_firewall_port_TCP = var.pvt_net_firewall_port_TCP
}

module "compute_instance" {
  source             = "./modules/compute_instance"
  project            = var.project
  user_name          = var.user_name
  machine_type       = var.machine_type
  count_manager      = var.count_manager
  count_worker       = var.count_worker
  key_ssh            = var.key_ssh
  private_subnetwork = module.management_network.private_subnetwork
  public_subnetwork  = module.management_network.public_subnetwork
}

# resource "google_service_account" "rexray" {
#   account_id   = "rexray"
#   display_name = "Account - Rexray"
# }

# resource "google_service_account_key" "mykey" {
#   service_account_id = google_service_account.rexray.name
# }

