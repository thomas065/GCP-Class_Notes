// project1 firewall
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.project1.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// project1 http
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.project1.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// project1 icmp
resource "google_compute_firewall" "icmp" {
  name    = "icmp"
  network = google_compute_network.project1.name

  allow {
      protocol = "icmp"
    }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["p1web"]
}

##############################################
// project2 firewall
resource "google_compute_firewall" "project2-allow-ssh" {
  name    = "project2-allow-ssh"
  network = google_compute_network.project2.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// tokyo-http
resource "google_compute_firewall" "project2-allow-http" {
  name    = "project2-allow-http"
  network = google_compute_network.project2.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// tokyo-icmp
resource "google_compute_firewall" "project2-icmp" {
  name    = "project2-icmp"
  network = google_compute_network.project2.name

  allow {
      protocol = "icmp"
    }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["p2web"]
}
