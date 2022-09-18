terraform {
  backend "s3" {
    bucket            = "hameed"
    dynamodb_table    = "my-project"
    key               = "terraform/practise/terraform.tfstate"
    region            = var.region
  }
}