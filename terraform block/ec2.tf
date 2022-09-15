resource "aws_spot_instance_request" "myinstances" {
  ami           = "ami-0bb6af715826253bf"
  spot_price    = "0.035"
  for_each      = toset(data.aws_availability_zones.all.names)
  instance_type = var.instances_type-map["sabbi"]
  user_data     = file("${path.module}/httpdserver.sh")
  availability_zone = each.key

  tags = {
    Name =  "for-${each.value}"
  }
}

data "aws_availability_zones" "all" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

output "az" {
  value = data.aws_availability_zones.all
}