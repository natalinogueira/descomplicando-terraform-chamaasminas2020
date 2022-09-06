provider "aws" {
  region  = "${terraform.workspace == "prod" ? "us-east-1" : "us-east-2"}"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "descomplicando-terraform-linuxtips"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
    encrypt = true # ENCRYPT SENSITIVE DATA OF STATE
  }
}
