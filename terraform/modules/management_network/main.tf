
resource "google_compute_network" "vpc_network" {
  name                    = "${var.project}-network"
  auto_create_subnetworks = "true"
}


resource "google_compute_firewall" "worker" {
  name        = "${var.project}-worker"
  network     = google_compute_network.vpc_network.id
  target_tags = ["worker", "manager"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.firewall_port_TCP
  }

  allow {
    protocol = "udp"
    ports    = var.firewall_port_UDP
  }

  depends_on = [google_compute_network.vpc_network]
}

resource "google_compute_firewall" "firewall_ssh" {
  name        = "${var.project}-ssh"
  network     = google_compute_network.vpc_network.id
  target_tags = ["ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  depends_on    = [google_compute_network.vpc_network]
}
