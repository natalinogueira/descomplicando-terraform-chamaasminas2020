provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}

#dynamobd usado para state locking - nao permitir escrita no state durante um execucao de apply, 
#evitando que o mesmo seja corrompido por execucoes simultaneas
terraform {
 backend "s3" {
   bucket = "descomplicando-terraform-linuxtips"
   aws_dynamodb_table = "terraform-state-lock-dynamodb"
   key    = "terraform-test.tfstate"
   region = "us-east-1"
  }
} 