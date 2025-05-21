// Subnets

// HQ
resource "google_compute_subnetwork" "twism-hq1" {
  name                     = "twism-hq1"
  ip_cidr_range            = "10.32.10.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.twismnetwork.id
  private_ip_google_access = true
}

