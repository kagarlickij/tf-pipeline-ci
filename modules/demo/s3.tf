resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  versioning {
    enabled = var.versioning_status
  }

  lifecycle {
    prevent_destroy = false
  }
}