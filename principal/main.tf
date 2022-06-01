provider "google" {
  project     = "stack-project-349919"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_instance" "instance-diff" {
 name         = "instance-diff"
 machine_type = "n1-standard-8"
 zone         = "us-central1-a" 
 count        = 1

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
 name         = "instance-for-dummies"
 machine_type = "n2-standard-4"
 zone         = "us-central1-c"
 count        = 4

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

resource "google_compute_instance" "instance-for-specs" {
 name         = "instance-for-specs"
 machine_type = "n2d-standard-4"
 zone         = "australia-southeast1-b" 
 count        = 4

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }
}

resource "google_redis_instance" "cache" {
  name           = "memory-cache"
  memory_size_gb = 5
}