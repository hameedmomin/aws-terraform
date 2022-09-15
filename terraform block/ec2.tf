resource "aws_spot_instance_request" "myinstances" {
  ami           = "ami-0bb6af715826253bf"
  spot_price    = "0.03"
  count         = 2
  instance_type = length(var.instances_type-list)
  user_data     = file("${path.module}/httpdserver.sh")

  tags = {
    Name = element(var.components, count.index)
  }
}

