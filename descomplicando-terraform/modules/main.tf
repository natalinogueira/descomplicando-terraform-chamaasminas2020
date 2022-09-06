provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "descomplicando-terraform-linuxtips"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
  }
}

# $ terraform init
# Initializing modules...
# - servers in servers

# Initializing the backend...

# Initializing provider plugins...

#############################################
# $ terraform state pull
# {
#   "version": 4,
#   "terraform_version": "0.12.31",
#   "serial": 20,
#   ...