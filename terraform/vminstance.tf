resource "google_compute_instance" "webserver" {
  name         = "webserver-idwall"
  machine_type = "n1-standard-1"
  tags         = ["webserver-tag", "ssh-tag"]
  zone         = data.google_compute_zones.available_zones.names[0]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }


  metadata_startup_script = file("${path.module}/extras-config.sh")

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {
    }
  }
}