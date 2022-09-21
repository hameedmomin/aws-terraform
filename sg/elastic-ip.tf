resource "aws_eip" "bastion_eip" {
  instance                 = module.ec2_bastion.id
  vpc                      = true
  depends_on               = [ module.vpc, module.ec2_bastion ]
  tags                     = local.common_tags
}

output "eip-bastion-ip" {
  value = aws_eip.bastion_eip.public_ip

}