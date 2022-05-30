provider "google" {
  project     = "stack-project-349919"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_instance" "instance-diff" {
 name         = "instance-diff"
 machine_type = "n1-standard-8"
 count        = 2
 zone         = "us-central1-a" 

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

  network_interface {
    network = "default"

    access_config {
    }
  }
}

resource "google_compute_instance" "instance-for-dummies" {
 name         = "instance-diff"
 machine_type = "n2-standard-4"
 zone         = "us-central1-c" 
 count        = 20

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

  network_interface {
    network = "default"

    access_config {
    }
  }
}