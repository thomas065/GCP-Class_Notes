# Forwarding Rule
resource "google_compute_global_forwarding_rule" "lb-entry_point" {
  name = "lb-gateway"
  ip_protocol = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range = "80"
  target = google_compute_target_http_proxy.proxi-1.id
  depends_on = [ google_compute_subnetwork.twism-hq ]
}

# Target Http Proxy
resource "google_compute_target_http_proxy" "proxi-1" {
  name = "proximity"
  url_map = google_compute_url_map.url-1.id
}

# URL Map
resource "google_compute_url_map" "url-1" {
  name = "cartographer"
  default_service = google_compute_backend_service.backend-1.id
}

# Backend Service
resource "google_compute_backend_service" "backend-1" {
  name = "iowa"
  protocol = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  timeout_sec = 10
  health_checks = [ google_compute_health_check.health-check-1.id ]
  enable_cdn = true
  backend {
    group = google_compute_region_instance_group_manager.app.instance_group
    balancing_mode = "UTILIZATION"
    capacity_scaler = 1.0
  }
}

# Health Check
resource "google_compute_health_check" "health-check-1" {
  name = "regis"
  http_health_check {
    port_specification = "USE_SERVING_PORT"
    request_path = "/"
  }
}