provider "google" {
  project     = "stack-project-349919"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_instance" "instance1" {
 name         = "instance1"
 machine_type = "n1-standard-32" # <<<<< Try changing this to n1-standard-8 to compare the costs
 zone         = "us-central1-a"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

 scheduling {
   preemptible = true
 }

  guest_accelerator {
    type = "nvidia-tesla-v100" # <<<<< Try changing this to nvidia-tesla-p4 to compare the costs
    count = 10
  }

  network_interface {
    network = "default"

    access_config {
    }
  }
}
