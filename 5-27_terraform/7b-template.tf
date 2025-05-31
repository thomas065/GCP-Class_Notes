 #https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template
 #https://developer.hashicorp.com/terraform/language/functions/file
 #Google Compute Engine: Regional Instance Template

 # Iowa Instance Template
resource "google_compute_region_instance_template" "app" {
  name         = "twism-template-instance"
  region       = google_compute_subnetwork.twism-hq1.region
  description  = "This template is used to clone twism"
  machine_type = "e2-medium"
  tags = ["web"] // don't forget to use tags if firewall has it

 # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.twism-hq1.id
    /*access_config {
      # Include this section to give the VM an external IP address
    } */
  }

 # Install Webserver using file() function
  metadata_startup_script = file("./website/index2.sh")
}
#################################################################################

# Tokyo Instance Template
resource "google_compute_region_instance_template" "app2" {
  name         = "tokyo-template-instance"
  region       = google_compute_subnetwork.tokyo-hq1.region
  description  = "This template is used to clone tokyo-hq1"
  machine_type = "e2-medium"
  tags = ["tokyonetwork-web"] // don't forget to use tags if firewall has it

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.tokyo-hq1.id
    /*access_config {
      # Include this section to give the VM an external IP address
    } */
  }

  metadata_startup_script = file("./website/index.sh")
}