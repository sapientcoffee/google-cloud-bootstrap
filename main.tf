##### Setup Project #####


locals {
    current_time = timestamp()
    # timestamp        = formatdate("YYYYMMDDhhmmss", local.current_time)
    timestamp        = formatdate("YYYYMMDD", local.current_time)

}

## Create  project
resource "google_project" "project" {
  name            = "${var.sandbox_project}-${local.timestamp}"
  project_id      = "${var.sandbox_project}-${local.timestamp}"
  billing_account = var.billing_id
#   folder_id       = google_folder.base.name
  lifecycle {
    ignore_changes = [
      labels
    ]
  }
}


