resource "google_compute_firewall" "firewall_ssh" {
  name    = "firewall-ssh-idwall"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  description   = "INGRESS"
  source_ranges = [var.variable_ssh_ip]
  target_tags   = ["ssh-tag"]
}

resource "google_compute_firewall" "firewall_http_https" {
  name    = "firewall-http-https-idwall"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  description   = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver-tag"]
}