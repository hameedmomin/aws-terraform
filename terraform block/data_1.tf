data "aws_availability_zones" "allzone" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "my_types" {
  for_each = toset([data.aws_availability_zones.allzone])
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name   = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}

output "instances-type" {
  value = {
    for offering, details in data.aws_ec2_instance_type_offerings.my_types: offering => details.instance_types
  }
}