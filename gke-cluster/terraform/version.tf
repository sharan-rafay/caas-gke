terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.23.0"
    }
  }

  required_version = ">= 0.14"
}

provider "google" {
  project = "dev-382813"
  region  = "us-central1"
  zone    = "us-central1-a"

}



