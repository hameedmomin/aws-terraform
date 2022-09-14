terraform {
  required_version = "~> 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt = false
    bucket = "hameed"
    key = "myterraform/tf.state"
    region = "us-east-1"
    dynamodb_table = "mytable"
  }
}

