// twismnetwork firewall
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.twismnetwork.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// http
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.twismnetwork.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// icmp
resource "google_compute_firewall" "icmp" {
  name    = "icmp"
  network = google_compute_network.twismnetwork.name

  allow {
      protocol = "icmp"
    }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
}

// rdp
resource "google_compute_firewall" "rdp" {
  name    = "rdp"
  network = google_compute_network.twismnetwork.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// db
resource "google_compute_firewall" "allow-db" {
  name    = "allow-db"
  network = google_compute_network.twismnetwork.name

  allow {
    protocol = "tcp"
    ports    = ["3306", "1521"] // 3306 is used for MySQL, 1521 is used for Oracle
  }

  source_ranges = ["0.0.0.0/0"]
}
##############################################
// tokyo firewall
resource "google_compute_firewall" "tokyo-allow-ssh" {
  name    = "tokyo-allow-ssh"
  network = google_compute_network.tokyo.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// tokyo-http
resource "google_compute_firewall" "tokyo-allow-http" {
  name    = "tokyo-allow-http"
  network = google_compute_network.tokyo.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// tokyo-icmp
resource "google_compute_firewall" "tokyo-icmp" {
  name    = "tokyo-icmp"
  network = google_compute_network.tokyo.name

  allow {
      protocol = "icmp"
    }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
}

// tokyo-rdp
resource "google_compute_firewall" "tokyo-rdp" {
  name    = "tokyo-rdp"
  network = google_compute_network.tokyo.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// tokyo-db
resource "google_compute_firewall" "tokyo-allow-db" {
  name    = "tokyo-allow-db"
  network = google_compute_network.tokyo.name

  allow {
    protocol = "tcp"
    ports    = ["3306", "1521"]
  }

  source_ranges = ["0.0.0.0/0"]
}