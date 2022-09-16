data "aws_ec2_instance_type_offerings" "visible" {
  for_each = toset(["us-eat-1a", "us-eat-1b", "us-eat-1e"])
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone-id"
}

output "offer" {
  value = data.aws_ec2_instance_type_offerings.visible.instance_types
}

