variable "tf_sa" {
  description = "Service Account for Terraform - note you must have Service Account Token Creator IAM role for your own account"
  type        = string
}

variable "deploy_project" {
  description = "GCP project to be spun up or down"
  type        = string
}

variable "bootstrap_project_id" {
  type        = string
  description = "Bootstrap project ID (tf state etc)"
  default     = "coffee-bootstrap"
}

variable "folder_name" {
  type        = string
  description = "Folder name for projects"
  default     = "Project Bridge"
}
variable "folder_parent" {
  type        = string
  description = "Location for the folder parent"
  default     = "organizations/694643552517"
}
