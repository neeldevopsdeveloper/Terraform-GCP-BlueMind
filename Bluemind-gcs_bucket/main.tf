resource "google_storage_bucket" "uploads_bucket" {
  name     = var.bucket_name
  location = var.bucket_location
  project  = var.project_id   
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}

resource "google_storage_bucket_iam_member" "cloud_run_upload_access" {
  bucket = google_storage_bucket.uploads_bucket.name
  role   = "roles/storage.objectAdmin"

  member = "serviceAccount:${var.cloud_run_service_account}"
}

