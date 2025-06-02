
# resource "tls_private_key" "app" {
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# resource "tls_self_signed_cert" "app" {
#   private_key_pem = tls_private_key.app.private_key_pem

#   subject {
#     common_name  = "app.example.com"
#     organization = "Example Org"
#   }

#   validity_period_hours = 8760  # 1 year
#   allowed_uses = [
#     "key_encipherment",
#     "digital_signature",
#     "server_auth"
#   ]

#   dns_names = ["app.example.com"]
# }

# # Resource: Certificate manager certificate
# resource "google_certificate_manager_certificate" "app" {
#   location    = google_compute_region_instance_group_manager.app.region
#   name        = "app-ssl-certificate"
#   description = "app Certificate Manager SSL Certificate"
#   scope       = "DEFAULT"
#   self_managed {
#     pem_certificate = tls_self_signed_cert.app.cert_pem
#     pem_private_key = tls_private_key.app.private_key_pem
#   }
# }

# # Resource: Regional HTTPS Proxy
# resource "google_compute_region_target_https_proxy" "lb" {
#   name   = "lb-https-proxy"
#   url_map = google_compute_region_url_map.lb.self_link
#   certificate_manager_certificates = [ google_certificate_manager_certificate.app.id ]
# }

# # Resource: Regional Forwarding Rule
# resource "google_compute_forwarding_rule" "lb_https" {
#   name        = "lb-https-forwarding-rule"
#   target      = google_compute_region_target_https_proxy.lb.self_link
#   port_range  = "443"
#   ip_protocol = "TCP"
#   ip_address = google_compute_address.lb.address
#   load_balancing_scheme = "EXTERNAL_MANAGED" # Creates current gen lb (not classic)
#   network = google_compute_network.main.id
#   # During the destroy process, we need to ensure LB is deleted first, before deleting VPC proxy-only subnet
#   depends_on = [ google_compute_subnetwork.regional_proxy_subnet ]
# }
