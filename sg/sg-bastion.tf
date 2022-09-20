module "public_bastion_sg" {
  source                     = "terraform-aws-modules/security-group/aws"
  version                    = "4.13.0"

  name                       = "public-bastion-sg"
  vpc_id                     = module.vpc.vpc_id
  ingress_rules              = ["ssh-tcp"]
  ingress_cidr_block         = ["0.0.0.0/16"]
  egress_rule                = ["all-all"]
  tags                       = local.common_tags

}


