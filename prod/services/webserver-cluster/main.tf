provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source                 = "../../../modules/services/webserver-cluster"
  cluster_name           = "terraform-example-prod"
  db_remote_state_bucket = "terraform-up-and-running-ch-307091e9f"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"
}
