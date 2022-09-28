variable "instance_type" {
  default = "t3.micro"
}
variable "private_instance_count" {
#  default   = 1
  type      = number
  description = "AWS private instances count"
}