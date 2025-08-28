terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "hpg-s3-bucket-for-tflock"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "hpg-dynamodb-for-tflock"
  }
}


provider "aws" {
  region = "us-east-1"
}


