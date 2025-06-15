
// Iowa
resource "google_compute_subnetwork" "project1-iowa" {
  name                     = "project1-iowa"
  ip_cidr_range            = "10.32.10.0/28"
  region                   = "us-central1"
  network                  = google_compute_network.project1.id
  private_ip_google_access = true
}

// Tokyo
resource "google_compute_subnetwork" "project2-tokyo" {
  name                     = "project2-tokyo"
  ip_cidr_range            = "192.230.10.0/28"
  region                   = "asia-northeast1"
  network                  = google_compute_network.project2.id
  private_ip_google_access = true
}

