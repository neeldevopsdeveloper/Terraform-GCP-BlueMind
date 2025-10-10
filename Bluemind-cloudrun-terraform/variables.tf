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

variable "db_port" {
  type        = number
  description = "Port number for the database"
  default     = 3306
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
  description = "JWT secret key for token signing"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "Application SECRET_KEY (from Secret Manager)"
  sensitive   = true
}

variable "gemini_key" {
  type        = string
  description = "Google Gemini API key (from Secret Manager)"
  sensitive   = true
}

variable "cloud_run_sa" {
  description = "Service account email used by Cloud Run"
  type        = string
}

variable "stripe_secret_key" {
  description = "Secret Manager ID for Stripe Secret Key"
  type        = string
}

variable "stripe_publishable_key" {
  description = "Secret Manager ID for Stripe Publishable Key"
  type        = string
}

# --- Newly added Stripe and Tax Secret variables ---

variable "stripe_monthly_price_id" {
  description = "Secret Manager ID for Stripe Monthly Price ID"
  type        = string
}

variable "stripe_annual_price_id" {
  description = "Secret Manager ID for Stripe Annual Price ID"
  type        = string
}

variable "canada_tax_rate_ids_prod" {
  description = "Secret Manager ID for Canada Tax Rate IDs (production)"
  type        = string
}
