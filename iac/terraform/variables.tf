// Variables to use accross the project
// which can be accessed by var.project_id
variable "project_id" {
  description = "The project ID to host the cluster in"
  default     = "aide1-482206"
}

variable "region" {
  description = "The region the cluster in"
  default     = "asia-east1"
}

variable "bucket" {
  description = "GCS bucket for MLE course"
  default     = "lehuyphuong-mlops-dev-20260106-1311"
}

variable "instance_name" {
  description = "name of instance"
  default = "jenkins-k4"
}

variable "machine_type" {
  description = "Machine type for the instance"
  default = "e2-medium"
}

variable "zone" {
  description = "zone of the instance"
  default = "asia-east1-a"
}

variable "boot_disk_image" {
  description = "boot disk image for the instance"
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "boot_disk_size" {
  description = "boot disk size for the instance"
  default = 50
}

variable "firewall_name" {
  description = "name of firewall rule"
  default = "jenkins-firewall-k4"
}

variable "ssh_keys" {
  description = "values of ssh key"
  default = "huyphuongvt27:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFtEXzpdDtXQsw8UJSQ4Sjv8lfvSo2s0ugcw/jX18cwE huyphuongvt27@gmail.com"
}