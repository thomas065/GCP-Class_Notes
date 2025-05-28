## ALB Frontend Static IP
output "lb_static_ip_address" {
  description = "The static IP address of the load balancer."
  value       = "http://${google_compute_address.lb.address}"
}

## https://developer.hashicorp.com/terraform/language/functions/join
output "compute_zones" {
  description = "Comma-separated compute zones"
  # convert set into string delimited by commas (CSV) before output
  value       = join(", ", data.google_compute_zones.available.names)
}

output "instance_external_ips" {
  value = {
    vm1 = "http://${google_compute_instance.twism-instance.network_interface[0].access_config[0].nat_ip}"
    vm2 = "http://${google_compute_instance.tokyo-instance.network_interface[0].access_config[0].nat_ip}"
  }
  description = "External IPs of both VMs"
}

# https://developer.hashicorp.com/terraform/language/values/outputs

 output "instance_external_ip" {
   value       = "http://${google_compute_instance.twism-instance.network_interface[0].access_config[0].nat_ip}"
   description = "The external IP address of the GCE instance."
 }