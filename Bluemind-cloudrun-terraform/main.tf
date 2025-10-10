resource "google_cloud_run_service" "default" {
  name     = "bluemind-app"
  location = var.region

  template {
    spec {
      service_account_name = var.cloud_run_sa

      containers {
        image = var.image_url

        volume_mounts {
          name       = "gcs-creds"
          mount_path = "/secrets"
        }

        env {
          name  = "GOOGLE_APPLICATION_CREDENTIALS"
          value = "/secrets/gcs-key.json"
        }

        env {
          name  = "GCS_BUCKET_NAME"
          value = var.gcs_bucket_name
        }

        env {
          name  = "GOOGLE_GEMINI_API_KEY"
          value = var.gemini_key
        }

        env {
          name  = "SECRET_KEY"
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
          name  = "DB_PORT"
          value = var.db_port
        }

        env {
          name  = "DB_USERNAME"
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

        # --- Secrets from Secret Manager ---
        env {
          name = "DB_PASSWORD"
          value_from {
            secret_key_ref {
              name = var.db_secret_id
              key  = "latest"
            }
          }
        }

        env {
          name = "STRIPE_SECRET_KEY"
          value_from {
            secret_key_ref {
              name = var.stripe_secret_key
              key  = "latest"
            }
          }
        }

        env {
          name = "STRIPE_PUBLISHABLE_KEY"
          value_from {
            secret_key_ref {
              name = var.stripe_publishable_key
              key  = "latest"
            }
          }
        }

        # --- Newly added Stripe and Tax Secrets ---
        env {
          name = "STRIPE_MONTHLY_PRICE_ID"
          value_from {
            secret_key_ref {
              name = var.stripe_monthly_price_id
              key  = "latest"
            }
          }
        }

        env {
          name = "STRIPE_ANNUAL_PRICE_ID"
          value_from {
            secret_key_ref {
              name = var.stripe_annual_price_id
              key  = "latest"
            }
          }
        }

        env {
          name = "CANADA_TAX_RATE_IDS_PROD"
          value_from {
            secret_key_ref {
              name = var.canada_tax_rate_ids_prod
              key  = "latest"
            }
          }
        }
      }

      volumes {
        name = "gcs-creds"
        secret {
          secret_name = "gcs-service-account"

          items {
            path = "gcs-key.json"
            key  = "latest"
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
