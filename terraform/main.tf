provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "management_network" {
  source                = "./modules/management_network"
  project               = var.project
  region                = var.region
  ip_cidr_range_private = var.ip_cidr_range_private
  ip_cidr_range_public  = var.ip_cidr_range_public
}

resource "google_compute_instance" "worker" {
  count        = "2"
  name         = "worker-${count.index + 1}"
  machine_type = "f1-micro"
  tags         = ["worker", "monitoring"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata = {
    ssh-keys = "erad:${file("~/.ssh/id_rsa_gcp_erad.pub")}"
  }

  network_interface {
    subnetwork = module.management_network.private_subnetwork
    access_config {
    }
  }
}

resource "google_compute_instance" "manager" {
  count        = "1"
  name         = "manager-${count.index + 1}"
  machine_type = "f1-micro"
  tags         = ["manager", "monitoring"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata = {
    ssh-keys = "erad:${file("~/.ssh/id_rsa_gcp_erad.pub")}"
  }

  network_interface {
    subnetwork = module.management_network.public_subnetwork
    access_config {
    }
  }
}
