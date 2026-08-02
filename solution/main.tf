data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "lab" {
  bucket = "${var.project_name}-lab-${data.aws_caller_identity.current.account_id}"

  tags = {
    Project = var.project_name
    Study   = "boaz-terraform-26"
    Week    = "1"
  }
}

resource "aws_s3_bucket_public_access_block" "lab" {
  bucket                  = aws_s3_bucket.lab.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# L3-⭐ 심화: versioning
resource "aws_s3_bucket_versioning" "lab" {
  bucket = aws_s3_bucket.lab.id
  versioning_configuration {
    status = "Enabled"
  }
}
