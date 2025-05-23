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

// tags
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

// http
# resource "google_compute_firewall" "allow-http" {
#   name    = "allow-http"
#   network = google_compute_network.twismnetwork.name

#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }

// https
# resource "google_compute_firewall" "allow-https" {
#   name    = "allow-https"
#   network = google_compute_network.twismnetwork.name

#   allow {
#     protocol = "tcp"
#     ports    = [ "443"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }

// icmp
# resource "google_compute_firewall" "icmp" {
#   name    = "icmp"
#   network = google_compute_network.twismnetwork.name

#   allow {
#     protocol = "icmp"
#   }
# }
