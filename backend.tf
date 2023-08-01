terraform {
  backend "gcs" {
    bucket = "${bootstrap_project_id}-tf-state"
    prefix = "terraform/state"
  }
}