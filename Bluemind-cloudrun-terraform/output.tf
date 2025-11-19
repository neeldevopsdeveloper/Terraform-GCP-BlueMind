# Outputs for Secret IDs (as-is)
output "db_secret_id" {
  value       = var.db_secret_id
  description = "DB Secret ID as provided"
}

output "stripe_secret_key" {
  value       = var.stripe_secret_key
  description = "Stripe Secret Key ID as provided"
}

output "stripe_publishable_key" {
  value       = var.stripe_publishable_key
  description = "Stripe Publishable Key ID as provided"
}

output "stripe_monthly_price_id" {
  value       = var.stripe_monthly_price_id
  description = "Stripe Monthly Price ID as provided"
}

output "stripe_annual_price_id" {
  value       = var.stripe_annual_price_id
  description = "Stripe Annual Price ID as provided"
}

output "canada_tax_rate_ids_prod" {
  value       = var.canada_tax_rate_ids_prod
  description = "Canada Tax Rate IDs (Prod) as provided"
}

# Optional: Sanitized versions for Cloud Run validation
output "db_secret_id_sanitized" {
  value       = replace(var.db_secret_id, "[^A-Za-z0-9_-]", "_")
  description = "DB Secret ID sanitized for Cloud Run"
}

output "stripe_secret_key_sanitized" {
  value       = replace(var.stripe_secret_key, "[^A-Za-z0-9_-]", "_")
  description = "Stripe Secret Key ID sanitized for Cloud Run"
}

output "stripe_publishable_key_sanitized" {
  value       = replace(var.stripe_publishable_key, "[^A-Za-z0-9_-]", "_")
  description = "Stripe Publishable Key ID sanitized for Cloud Run"
}

output "stripe_monthly_price_id_sanitized" {
  value       = replace(var.stripe_monthly_price_id, "[^A-Za-z0-9_-]", "_")
  description = "Stripe Monthly Price ID sanitized for Cloud Run"
}

output "stripe_annual_price_id_sanitized" {
  value       = replace(var.stripe_annual_price_id, "[^A-Za-z0-9_-]", "_")
  description = "Stripe Annual Price ID sanitized for Cloud Run"
}

output "canada_tax_rate_ids_prod_sanitized" {
  value       = replace(var.canada_tax_rate_ids_prod, "[^A-Za-z0-9_-]", "_")
  description = "Canada Tax Rate IDs sanitized for Cloud Run"
}
