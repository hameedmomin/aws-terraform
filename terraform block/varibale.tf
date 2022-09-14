variable "region" {
  description = "the region where our resouces are present"
  type = string
  default = "us-east-1"
}

variable "instances_type" {
  default = "t2.micro"
  type = string
}
variable "CIRD_BLOCK" {
  default = "10.0.0.0/16"
  type    = bool
}
variable "vpcname" {
  default = "myfirstvpc"
  type    = string
}