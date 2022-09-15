variable "region" {
  description = "the region where our resouces are present"
  type = string
  default = "us-east-1"
}
/*
variable "instances_type" {
  default = "t2.micro"
  type = string
}*/

variable "instances_type-list" {
  default = ["t2.micro", "t3.micro"]
  type = list(string)
}

variable "CIRD_BLOCK" {
  default = ["10.0.0.0/16"]

}
variable "vpcname" {
  default = "myfirstvpc"
  type    = string
}
variable "tags" {
  default = ["hameed", "sabbi"]

}
#data "aws_ec2_instance_types" "" {}