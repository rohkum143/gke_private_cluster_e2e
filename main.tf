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
