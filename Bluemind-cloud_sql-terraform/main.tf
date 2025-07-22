resource "google_sql_database_instance" "default" {
  name             = "bluemind"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled    = true
    }
  }

  deletion_protection = false
}

resource "google_sql_user" "app_user" {
  name     = var.db_user
  instance = google_sql_database_instance.default.name
  password = var.db_password
}

