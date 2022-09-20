module "ec2_private" {
  source                      = "terraform-aws-modules/ec2_bastion/aws"
  version                     = "4.1.4"
  depends_on                  = [module.vpc]
  name                        = "${var.environment}-Private"
  ami                         = data.aws_ami.centos8.id
  instances_count             = var.private_instance_count
  instances_type              = var.instance_type
#  subnet_id                  = module.vpc.private_subnets[0]
  subnet_ids                  = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  vpc_security_group_id       = [module.public_bastion_sg.bastion_security_group_id]
  tags                        = local.common_tags
  user_data                   = file("${path.module}/apache.sh")





}
