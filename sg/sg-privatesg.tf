module "private_sg" {
  source                     = "terraform-aws-modules/security-group/aws"
  version                    = "4.13.0"

  name                       = "private-sg"
  vpc_id                     = module.vpc.vpc_id
  ingress_rules              = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_block         = [module.vpc.vpc_cidr_block]
  egress_rule                = ["all-all"]
  tags                       = local.common_tags

}


