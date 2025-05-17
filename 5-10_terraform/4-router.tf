# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "twism-hq" {
  name    = "twism-hq"
  region  = "us-central1"
  network = google_compute_network.twismnetwork.id
}

resource "google_compute_router" "twism-prod" {
  name    = "twism-prod"
  region  = "asia-northeast1"
  network = google_compute_network.twismprod.id
}