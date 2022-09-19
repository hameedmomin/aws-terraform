/*
module "myvpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"

  name                                          = "myvpc"
  cidr                                          = "20.0.0.0/16"
  azs                                           = [ "us-eat-1a", "us-east-1b"]
  private_subnets                               = ["20.0.1.0/24", "20.0.2.0/24"]
  public_subnets                                = ["20.0.11.0/24", "20.0.12.0/24"]


  #creating DB subnets should be separatly so we have to acces it and give it in a booling
  create_database_subnet_group                  = true
  create_database_subnet_route_table            = true
  database_subnets                              = ["20.0.21.0/24", "20.0.22.0/24"]
#  create_database_nat_gateway_route             = true
#  create_database_internet_gateway_route        = true #(deafult is false)

# NAT gateway - Outbound communication
  enable_nat_gateway                             = true
  single_nat_gateway                             = true #(if it is false it will create two natgatwwayfor two regions)


 # VPC DNS important parameters
  enable_dns_hostnames                           = true
  enable_dns_support                             = true

 #anything tags = {} (its a arguement )
 #anthing tags{} ( its ablock )

  public_subnet_tags                             = {
    Type                                         = "public-subnets"
  }
  private_subnet_tags                            = {
    Type                                         = "private-subnets"
  }
  database_subnet_tags                           = {
    Type                                         = "database-subnets"
  }
  tags                                           = {
    Owner                                        = "hameed"
  }
  vpc_tags                                       = {
    Type                                         = "vpc-dev"

  }

}
*/
