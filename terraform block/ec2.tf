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
data "aws_ec2_instance_type_offerings" "types" {
  for_each = toset(["us-eat-1a", "us-eat-1b", "us-eat-1e"])
  filter {
    name   = "instance-type"
    values = ["t2.micro", "t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone-id"
}

/*
output "instancestype" {
  value = data.aws_ec2_instance_type_offerings.types.instance_types
}
*/

output "instancestype1" {
  value = [for types in data.aws_ec2_instance_type_offerings.types : types.instance_types]

}

/*
output "az" {
  value = data.aws_availability_zones.all
}

output "availability" {
  value = {
    for az in
  }
}*/
