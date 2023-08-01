##### Setup Project #####

# Used to pull the provider projects billing/org IDs for our fresh project
data "google_project" "tf-project" {
}

resource "google_project" "this-project" {
  project_id          = "${var.playpen_name}-${local.uid}"
  name                = "${var.playpen_name}-${local.uid}"
  org_id              = data.google_project.tf-project.org_id
  billing_account     = data.google_project.tf-project.billing_account
  auto_create_network = true
}

##### Enable required APIs #####

resource "google_project_service" "service" {
  project = google_project.this-project.project_id
  for_each = toset([
    "iam.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "osconfig.googleapis.com",
    # note, this is a requirement for OS config, it uses this service to store patch compliance data
    "containeranalysis.googleapis.com",
  ])
  service = each.value
  # note compute.googleapis.com can't seem to destroy and generates errors otherwise
  # but as we are destroying the project too it's a moot point
  disable_on_destroy = false
}

# Base folder
resource "google_folder" "base" {
  display_name = var.folder_name
  parent       = var.folder_parent
}

## Create bootstrap project
resource "google_project" "bootstrap" {
  name            = var.bootstrap_project_id
  project_id      = var.bootstrap_project_id
  billing_account = var.billing_id
  folder_id       = google_folder.base.name
  lifecycle {
    ignore_changes = [
      labels
    ]
  }
}

