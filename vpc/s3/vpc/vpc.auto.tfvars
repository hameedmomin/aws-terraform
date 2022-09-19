#remember here if we dont give variables in this then we have to give a flag while terrafrom apply "terraform apply -var-files=variables

vpc-name                                  = "myvpc"
cidr_block                                = "20.0.0.0/16"
availability-zones                        = "availability zones"
public_subnets                            = "Range of public subnets"
private_subnets                           = ["20.0.1.0/24", "20.0.2.0/24"]
database_subnets                          = ["20.0.21.0/24", "20.0.22.0/24"]
create_database_subnet_route_table        = true
create_database_subnet_group              = true
enable_nat_gateway                        = true
single_nat_gateway                        = true