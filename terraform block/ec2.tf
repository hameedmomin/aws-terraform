resource "aws_spot_instance_request" "myinstances" {
  ami           = "ami-0bb6af715826253bf"
  spot_price    = "0.03"
  count         =  3
  instance_type = "t2.micro"

  tags = {
    Name = "CheapWorker"
  }
}