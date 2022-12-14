module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"

  name                                          = "${local.name}-${var.vpc-name}"
  cidr                                          = var.cidr_block
  azs                                           = var.availability-zones
  private_subnets                               = var.private_subnets
  public_subnets                                = var.public_subnets


  #creating DB subnets should be separatly so we have to acces it and give it in a booling
  create_database_subnet_group                  = var.create_database_subnet_group
  create_database_subnet_route_table            = var.create_database_subnet_route_table
  database_subnets                              = var.database_subnets
  #  create_database_nat_gateway_route             = true
  #  create_database_internet_gateway_route        = true #(deafult is false)

  # NAT gateway - Outbound communication
  enable_nat_gateway                             = var.enable_nat_gateway
  single_nat_gateway                             = var.single_nat_gateway #(if it is false it will create two natgatwwayfor two regions)


  # VPC DNS important parameters
  enable_dns_hostnames                           = true
  enable_dns_support                             = true

  #anything tags = {} (its a arguement )
  #anthing tags{} ( its ablock )

  tags                                           = local.common_tags
  vpc_tags                                       = local.common_tags

  public_subnet_tags                             = {
    Type                                         = "public-subnets"
  }
  private_subnet_tags                            = {
    Type                                         = "private-subnets"
  }
  database_subnet_tags                           = {
    Type                                         = "database-subnets"
  }
/*
  tags                                           = {
    Owner                                        = "hameed"
  }
*/

}
