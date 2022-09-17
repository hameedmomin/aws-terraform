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

/*
output "offer" {
  value = toset([for avail in data.aws_ec2_instance_type_offerings.visible: avail.locations])
}
*/

output "offer_1" {
  value = {
    for getting, offering in data.aws_ec2_instance_type_offerings.visible: getting => offering.instance_types
  }
}