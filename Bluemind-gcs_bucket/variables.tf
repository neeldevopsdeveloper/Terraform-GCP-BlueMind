variable "bucket_name" {
  type        = string
  description = "Globally unique GCS bucket name"
}

variable "bucket_location" {
  type        = string
  default     = "northamerica-northeast2"
}

variable "cloud_run_service_account" {
  type        = string
  description = "Email of the Cloud Run service account"
}

variable "project_id" {
  type        = string
  description = "GCP Project ID to create the bucket in"
}
