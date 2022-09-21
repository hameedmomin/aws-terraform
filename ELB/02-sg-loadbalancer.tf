module "loadbalancer_sg" {
  source                     = "terraform-aws-modules/security-group/aws"
  version                    = "4.13.0"

  name                       = "loadbalancer-sg"
  vpc_id                     = module.vpc.vpc_id
  ingress_rules              = ["http-81-tcp"]
  ingress_cidr_blocks        = ["0.0.0.0/0"]
  egress_rules               = ["all-all"]
  tags                       = local.common_tags

}


