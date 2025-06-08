// HQ
resource "google_compute_subnetwork" "twism-hq" {
  name                     = "twism-hq"
  ip_cidr_range            = "10.32.10.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.twismnetwork.id
  purpose = "PRIVATE"
  depends_on = [ google_compute_network.twismnetwork ]
}
