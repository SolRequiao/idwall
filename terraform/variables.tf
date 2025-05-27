variable "variable_region" {
  description = "Regiao do Google Cloud Platform"
  type        = string
  default     = "us-central1"
}

variable "variable_ssh_ip" {
  description = "IP de acesso SSH"
  type        = string
  default     = "0.0.0.0/0"
}

data "google_compute_zones" "available_zones" {
  region = var.variable_region
}