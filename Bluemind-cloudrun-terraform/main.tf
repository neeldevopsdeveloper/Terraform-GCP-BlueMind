resource "google_cloud_run_service" "default" {
  name     = "bluemind-app"
  location = var.region

  template {
    spec {
      containers {
        image = var.image_url

       env {
         name  = "GCS_BUCKET_NAME"
         value = var.gcs_bucket_name
       }

        env {
          name = "GOOGLE_GEMINI_API_KEY"
          value = var.gemini_key
        }

        env {
          name = "SECRET_KEY"
          value = var.secret_key
        }

      env {
        name  = "DB_HOST"
        value = var.db_connection_name
      }

      env {
        name  = "DB_NAME"
        value = var.db_name
      } 

      env {
        name = "DB_PORT"
        value = "var.db_port"
      }

      env {
        name = "DB_USERNAME"
        value = var.db_user
      }

      env {
        name  = "EMAIL_USER"
        value = var.email_user
       }

      env {
        name  = "EMAIL_PASSWORD"
        value = var.email_password
       }

     env {
       name  = "JWT_SECRET"
       value = var.jwt_secret
      }

        env {
          name = "DB_PASSWORD"
          value_from {
            secret_key_ref {
              name = var.db_secret_id
              key  = "latest"
            }
          }
        }
      }
     }

  }


  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "public_invoker" {
  service  = google_cloud_run_service.default.name
  location = var.region
  role     = "roles/run.invoker"
  member   = "allUsers"
}
