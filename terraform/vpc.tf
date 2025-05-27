resource "google_compute_network" "vpc" {
  name                    = "vpc-idwall"
  auto_create_subnetworks = false

}

resource "google_compute_subnetwork" "subnet" {
  name                     = "subnet-idwall"
  network                  = google_compute_network.vpc.id
  region                   = var.variable_region
  ip_cidr_range            = "192.168.0.0/16"
  private_ip_google_access = true
}