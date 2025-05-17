// HQ Nat
resource "google_compute_router_nat" "twism-nat" {
  name   = "twism-nat"
  router = google_compute_router.twism-router.name
  region = "us-central1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.twism-hq1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.twism-nat.self_link]
}

resource "google_compute_address" "twism-nat" {
  name         = "twism-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region = "us-central1"
}

// Tokyo Nat
resource "google_compute_router_nat" "tokyo1-nat" {
  name   = "tokyo1-nat"
  router = google_compute_router.tokyo-router.name
  region = "asia-northeast1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.tokyo1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.tokyo1-nat.self_link]
}

resource "google_compute_address" "tokyo1-nat" {
  name         = "tokyo1-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region = "asia-northeast1"
}