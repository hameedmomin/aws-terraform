terraform {
  required_version = "~> 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "aws-terraform/hameed"
    key = "myterraform/tf.state"
    region = "us-east-1"
    dynamo_db = "mytable"
  }
}

