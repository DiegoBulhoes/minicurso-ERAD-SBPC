provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "management_network" {
  source            = "./modules/management_network"
  project           = var.project
  zone              = var.zone
  region            = var.region
  firewall_port_UDP = values(var.firewall_port_UDP)
  firewall_port_TCP = values(var.firewall_port_TCP)
}

module "compute_instance" {
  source        = "./modules/compute_instance"
  project       = var.project
  user_name     = var.user_name
  machine_type  = var.machine_type
  count_manager = var.count_manager
  count_worker  = var.count_worker
  key_ssh       = var.key_ssh
  network       = module.management_network.vpc_network
}
