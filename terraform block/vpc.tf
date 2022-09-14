resource "aws_vpc" "firstvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpcname
  }
}
resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.firstvpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "publicsubnet"
  }
}
resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.firstvpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "privatesubnet"
  }
}
