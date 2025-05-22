// twismnetwork firewall
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.twismnetwork.name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// http
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.twismnetwork.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// icmp
resource "google_compute_firewall" "icmp" {
  name    = "icmp"
  network = google_compute_network.twismnetwork.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
}