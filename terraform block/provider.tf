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
  region = var.region
}

terraform {
  backend "s3" {
    encrypt = false
    bucket = "hameed"
    key = "myterraform/tf.state"
    region = var.region
    dynamodb_table = "mytable"
  }
}

