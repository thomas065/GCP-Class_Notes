# https://www.terraform.io/language/settings/backends/gcs
# https://registry.terraform.io/providers/hashicorp/google/latest // latest version for required providers
terraform {
  backend "gcs" {
    bucket      = "terraformblues"
    prefix      = "terraform/state"
    credentials = "mykey.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
