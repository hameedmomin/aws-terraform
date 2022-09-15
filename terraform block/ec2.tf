/*resource "aws_spot_instance_request" "myinstances" {
  ami           = "ami-0bb6af715826253bf"
  spot_price    = "0.035"
  count         = 2
  instance_type = var.instances_type-map["sabbi"]
  user_data     = file("${path.module}/httpdserver.sh")

  tags = {
    Name =  "${count.index}"
  }
}*/

data "aws_availability_zones" "all" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

output "az" {
  value = data.aws_availability_zones.all
}