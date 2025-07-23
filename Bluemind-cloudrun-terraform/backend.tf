terraform {
  backend "gcs" {
    bucket = "bluemind-tf-state"
    prefix = "cloudrun/terraform.tfstate"
  }
}

