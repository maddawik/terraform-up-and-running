terraform {
  required_version = "1.14.3"
  backend "s3" {
    bucket = "terraform-up-and-running-ch-307091e9f"
    key    = "prod/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"

    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true
  db_name             = "example_database"

  # Uhhh user/pass?
  username = var.db_username
  password = var.db_password
}
