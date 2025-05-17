// HQ router
resource "google_compute_router" "twism-router" {
  name    = "twism-router"
  region  = "us-central1"
  network = google_compute_network.twismnetwork.id
}

// Tokyo
resource "google_compute_router" "tokyo-router" {
  name    = "tokyo-router"
  region  = "asia-northeast1"
  network = google_compute_network.tokyo.id
}