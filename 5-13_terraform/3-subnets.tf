// Subnets

// HQ
resource "google_compute_subnetwork" "twism-hq1" {
  name                     = "twism-hq1"
  ip_cidr_range            = "10.32.10.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.twismnetwork.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "twism-hq2" {
  name                     = "twism-hq2"
  ip_cidr_range            = "10.32.11.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.twismnetwork.id
  private_ip_google_access = true
}

// Tokyo
resource "google_compute_subnetwork" "tokyo1" {
  name                     = "tokyo1"
  ip_cidr_range            = "10.32.20.0/24"
  region                   = "asia-northeast1"
  network                  = google_compute_network.tokyo.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "tokyo2" {
  name                     = "tokyo2"
  ip_cidr_range            = "10.32.21.0/24"
  region                   = "asia-northeast1"
  network                  = google_compute_network.tokyo.id
  private_ip_google_access = true
}