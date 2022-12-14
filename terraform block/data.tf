/*
data "aws_ec2_instance_type_offerings" "visible" {
  for_each = toset(["us-east-1a", "us-east-1b", "us-east-1e"])
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

output "offer" {
  value = toset([for avail in data.aws_ec2_instance_type_offerings.visible: avail.instance_types])
}

output "offer_1" {
  value = {
    for avail, getting in data.aws_ec2_instance_type_offerings.visible: avail => getting.instance_types
  }
}*/