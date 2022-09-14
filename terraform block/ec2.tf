resource "aws_spot_instance_request" "myinstances" {
  ami           = "ami-0bb6af715826253bf"
  spot_price    = "0.03"
  instance_type = var.instances_type
  user_data     = file("${path.module}/httpdserver.sh")

  tags = {
    Name = "ec2-1"
  }
}

