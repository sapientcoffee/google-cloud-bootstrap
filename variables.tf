variable "sandbox_project" {
  description = "GCP project to be spun up or down"
  type        = string
}

variable "bootstrap_project_id" {
  type        = string
  description = "Bootstrap project ID"
  default     = "bootstrap-coffee"
}


variable "region" {
  description = "GCP region"
  type        = string
  default = "europe-west1"
}

variable "zone" {
  description = "GCP zone"
  type = string
  default = "europe-west1-c"
}


variable "billing_id" {
    type = string
    default = "017C65-6AC5ED-18E460" 
}