# Ref: https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/blob/master/examples/simple_autopilot_public
# To define that we will use GCP
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.80.0" // Provider version
    }
  }
  required_version = "1.14.3" // Terraform version
}

// The library with methods for creating and
// managing the infrastructure in GCP, this will
// apply to all the resources in the project
provider "google" {
  project     = var.project_id
  region      = var.region
}

// Google Kubernetes Engine
resource "google_container_cluster" "gke_mlops1" {
  name     = "${var.project_id}-gke"
  location = var.region
  // Enabling Autopilot for this cluster
  enable_autopilot = true
}

resource "google_storage_bucket" "bucket_mlops_dev" {
  name          = var.bucket
  location      = var.region
  force_destroy = true
  uniform_bucket_level_access = true
}

resource "google_compute_instance" "jenkins_mlop1" {
  name = var.instance_name
  machine_type = var.machine_type
  zone = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size = var.boot_disk_size
    }
  }

  network_interface {
    network = "default"
    access_config {
      // external public IP
    }
  }

  metadata = {
    ssh-keys = var.ssh_keys
  }
}

resource "google_compute_firewall" "firewall_mlops1" {
  name = var.firewall_name
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["8081", "50000"]
  }

  source_ranges = ["0.0.0.0/0"] # allow all traffic
  
}