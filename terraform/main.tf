provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
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
    network = google_compute_network.vpc_network.self_link
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
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "${var.project}-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "${var.project}-subnet"
  ip_cidr_range = "10.10.0.0/24"
  network       = google_compute_network.vpc_network.self_link
  depends_on    = [google_compute_network.vpc_network]
  region        = var.region
}

resource "google_compute_firewall" "firewall" {
  name    = "${var.project}-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "9100", "9090", "2377"]
  }
  source_ranges = ["0.0.0.0/0"]
}
