
resource "google_compute_instance" "worker" {
  count        = "2"
  name         = "worker-${count.index + 1}"
  machine_type = "n1-standard-1"
  tags         = ["worker", "monitoring"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata = {
    ssh-keys = "erad:${file(var.key_ssh)}"
  }

  network_interface {
    subnetwork = var.private_subnetwork
    access_config {
    }
  }
}

resource "google_compute_instance" "manager" {
  count        = "1"
  name         = "manager-${count.index + 1}"
  machine_type = "n1-standard-1"
  tags         = ["manager", "monitoring"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata = {
    ssh-keys = "erad:${file(var.key_ssh)}"
  }

  network_interface {
    subnetwork = var.public_subnetwork
    access_config {
    }
  }
}

resource "google_compute_instance" "nfs" {
  count        = "1"
  name         = "nfs-${count.index + 1}"
  machine_type = "n1-standard-1"
  tags         = ["nfs", "monitoring"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata = {
    ssh-keys = "erad:${file(var.key_ssh)}"
  }

  network_interface {
    subnetwork = var.private_subnetwork
    access_config {
    }
  }
}
