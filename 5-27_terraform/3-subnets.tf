// Subnets

// HQ
resource "google_compute_subnetwork" "twism-hq1" {
  name                     = "twism-hq1"
  ip_cidr_range            = "10.32.10.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.twismnetwork.id
  private_ip_google_access = true
}

# Regional Proxy-Only Subnet 
# Required for Regional Application Load Balancer for traffic offloading
resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name          = "regional-proxy-subnet"
  region        = "us-central1"
  ip_cidr_range = "192.168.255.0/24"
  # This purpose reserves this subnet for regional Envoy-based load balancers
  purpose       = "REGIONAL_MANAGED_PROXY"
  network       = google_compute_network.twismnetwork.id
  role          = "ACTIVE"
}

// Tokyo
resource "google_compute_subnetwork" "tokyo-hq1" {
  name                     = "tokyo-hq1"
  ip_cidr_range            = "10.32.20.0/24"
  region                   = "asia-northeast1"
  network                  = google_compute_network.tokyonetwork.id
  private_ip_google_access = true
}
