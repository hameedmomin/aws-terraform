module "ec2_bastion" {
  source                       = "terraform-aws-modules/ec2-instance/aws"
  version                      = "4.1.4"
  name                         = "${var.environment}-BastionHost"
  ami                          = data.aws_ami.centos8.id
  instance_type               = var.instance_type
  subnet_id                    = module.vpc.public_subnets[0]
  vpc_security_group_ids       = [module.public_bastion_sg.security_group_id]
  tags                         = local.common_tags
}


