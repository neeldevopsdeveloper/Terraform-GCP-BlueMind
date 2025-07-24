variable "project_id" {}
variable "region" {}
variable "db_connection_name" {}
variable "db_secret_id" {}

variable "image_url" {
  description = "Full Docker image URL for Cloud Run"
  type        = string
}

variable "image_tag" {
  description = "Git commit or image tag to deploy"
  type        = string
}

variable "gcs_bucket_name" {
  type        = string
  description = "GCS bucket name for uploads"
}

variable "db_user" {
  type        = string
  description = "MySQL username"
}

variable "db_name" {
  type        = string
  description = "MySQL database name"
}
variable "email_user" {
  description = "Email username used for authentication"
  type        = string
  sensitive   = true
}

variable "email_password" {
  description = "Email password used for authentication"
  type        = string
  sensitive   = true
}
variable "jwt_secret" {
  type        = string
  sensitive   = true
}
variable "secret_key" {
  type        = string
  description = "Name of the SECRET_KEY in Secret Manager"
  sensitive   = true

}

variable "gemini_key" {
  type        = string
  description = "Name of the Gemini API key in Secret Manager"
  sensitive   = true

}
variable "db_port" {
  type        = number
  description = "Port number for the database"
  default     = 3306
}

variable "cloud_run_sa" {
  description = "The service account email to run the Cloud Run service with."
  type        = string
}
