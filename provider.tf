provider "google" {
  project         = var.bootstrap_project_id
  region          = var.region
  zone            = var.zone
  request_timeout = "60s"
}

provider "google-beta" {
  alias           = "google-beta"
  project         = var.bootstrap_project_id
  region          = var.region
  zone            = var.zone
  access_token	  = data.google_service_account_access_token.default.access_token
  request_timeout = "60s"
}