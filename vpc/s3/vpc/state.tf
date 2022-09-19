data "terraform_remote_state" "vpc" {
  backend          = "s3"
  config           = {
    bucket         = "hameed"
    key            =  "terraform/practise/terraform.tfstate"
    region         = "us-east-1"

  }
}