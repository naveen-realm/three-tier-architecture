terraform {
  backend "s3" {
    bucket = var.backend_bucket_name
    key    = var.backend_bucket_key
    region = var.backend_bucket_region
  }
}