############### Provider Start ######################

provider "google" {
  credentials = "${file(var.credentials)}"
  project = "${var.project}"
  region  = "${var.region}"
  
}

############### Provider End ######################
############### Backend Start ######################

terraform {
 backend "gcs" {
   bucket  = "rohkum-terraform-state-test"
   prefix  = "gke/state"
   credentials = "account.json"
 }
}

############### Backend End ######################

resource "google_folder" "base_folder" {
  display_name = var.name
  parent       = var.base-folder
}

resource "google_folder" "core_folder" {
  display_name = "control-plane"
  parent       = google_folder.base_folder.name
}