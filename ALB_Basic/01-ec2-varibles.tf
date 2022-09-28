variable "instance_type" {
  default = "t3.micro"
}
variable "private_instance_count" {
  default   = 2
  type      = number
  description = "AWS private instances count"
}