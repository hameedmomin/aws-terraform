resource "aws_spot_instance_request" "spot" {
  ami                         = toset(data.aws_ami.centos8)
  for_each                    = toset(keys({ for getting, avail in data.aws_ec2_instance_type_offerings.my_types : getting => avail.instance_types if length(avail.instance_types) !=0}))
  spot_price                  = "0.035"
  instance_type               = var.instance_type
  availability_zone           = each.key

  tags = {
    Name                      = "demo-${each.key}"
  }
}