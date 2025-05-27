terraform {
  required_version = ">= 1.11.4"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.36.1"
    }
  }
}

provider "google" {
  credentials = file("./credentials_file.json")
  project     = "teste-terraform-440016"
  region      = var.variable_region
}