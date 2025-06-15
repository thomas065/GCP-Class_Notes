# Iowa Virtual Machine
 resource "google_compute_instance" "project1-instance" {
   name         = "project1-instance"
   machine_type = "n2-standard-2"
   zone         = "us-central1-a"

   tags = ["p1web"]

   boot_disk {
     initialize_params {
       image = "debian-cloud/debian-12"
     }
   }

   network_interface {
    //network = google_compute_network.twismnetwork.name
     subnetwork = google_compute_subnetwork.project1-iowa.name
     access_config {
      // Ephemeral public IP
     }
   }

   metadata_startup_script = file("./website/index2.sh")
 }

# Tokyo Virtual Machine
 resource "google_compute_instance" "project2-instance" {
   name         = "project2-instance"
   machine_type = "n2-standard-2"
   zone         = "asia-northeast1-a"

   tags = ["p2web"]

   boot_disk {
     initialize_params {
       image = "debian-cloud/debian-12"
     }
   }

   network_interface {
    //network = google_compute_network.twismnetwork.name
     subnetwork = google_compute_subnetwork.project2-tokyo.name
     access_config {
      // Ephemeral public IP
     }
   }

   metadata_startup_script = file("./website/index.sh")
 }