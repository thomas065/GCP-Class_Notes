# Virtual Machine
resource "google_compute_instance" "twism-instance" {
  name         = "twism-instance"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = [ "web" ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    //network = google_compute_network.twismnetwork.name
    subnetwork = google_compute_subnetwork.twism-hq1.name
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("./website/index.sh")
}
