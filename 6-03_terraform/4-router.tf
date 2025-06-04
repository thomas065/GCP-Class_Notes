// HQ router
resource "google_compute_router" "twism-router" {
  name    = "twism-router"
  region  = "us-central1"
  network = google_compute_network.twismnetwork.id
}

