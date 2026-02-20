terraform {
  required_version = "1.14.3"
  backend "s3" {
    bucket = "terraform-up-and-running-ch-307091e9f"
    key    = "global/iam/terraform.tfstate"
    region = "us-east-2"

    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "example" {
  count = 3
  name  = var.user_names[count.index]
}
