// twismnetwork firewall
resource "google_compute_firewall" "allow-ssh" {
  name      = "allow-ssh"
  network   = google_compute_network.twismnetwork.name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// tags for Iowa firewall
resource "google_compute_firewall" "allow-tag" {
  name    = "allow-tag"
  network = google_compute_network.twismnetwork.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags = ["web"]

  source_ranges = ["0.0.0.0/0"]
}
###############################################################

// Tokyo-Network firewall
resource "google_compute_firewall" "allow-tokyo-ssh" {
  name      = "allow-tokyo-ssh"
  network   = google_compute_network.tokyonetwork.name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// tags for Tokyo firewall
 resource "google_compute_firewall" "allow-http" {
   name    = "allow-http"
   network = google_compute_network.tokyonetwork.name
   allow {
     protocol = "tcp"
     ports    = ["80"]
   }
   target_tags = ["tokyonetwork-web"]
   source_ranges = ["0.0.0.0/0"]
 }
