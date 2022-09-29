module "ec2_private" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "2.17.0"
  depends_on                  = [module.vpc]
  name                        = "${var.environment}-Private"
  ami                         = data.aws_ami.centos8.id
  instance_type               = var.instance_type
  subnet_id                   = module.vpc.private_subnets
#  subnet_ids                   = [module.vpc.private_subnets[0],module.vpc.private_subnets[1]  ]
  count                       =  var.private_instance_count
  vpc_security_group_ids      = [module.private_sg.security_group_id]
  tags                        = local.common_tags
  user_data                   = file("${path.module}/apache.sh")

}


module "ec2_bastion" {
  source                       = "terraform-aws-modules/ec2-instance/aws"
  version                      = "4.1.4"
  name                         = "${var.environment}-BastionHost"
  ami                          = data.aws_ami.centos8.id
  instance_type                = var.instance_type
  subnet_id                    = module.vpc.public_subnets[0]
  vpc_security_group_ids       = [module.public_bastion_sg.security_group_id]
  tags                         = local.common_tags
}




