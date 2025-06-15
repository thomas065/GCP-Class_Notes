resource "google_compute_network_peering" "p1-to-p2" {
  name         = "p1-to-p2"
  network      = google_compute_network.project1.self_link
  peer_network = google_compute_network.project2.self_link
}

resource "google_compute_network_peering" "p2-to-p1" {
  name         = "p2-to-p1"
  network      = google_compute_network.project2.self_link
  peer_network = google_compute_network.project1.self_link
}

# resource "google_compute_network" "project2to1" {
#   name                    = "foobar"
#   auto_create_subnetworks = "false"
# }

# resource "google_compute_network" "project1to2" {
#   name                    = "other"
#   auto_create_subnetworks = "false"
# }