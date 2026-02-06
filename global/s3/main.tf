terraform {
  required_version = "1.14.3"
  backend "s3" {
    bucket = "terraform-up-and-running-ch-307091e9f"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-2"

    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = "us-east-2"
}

# Statefile
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-ch-307091e9f"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
