output "ec2_bastion_id" {
  description                     = "The ID of the BastionHost"
  value                           = module.ec2_bastion.id
}
output "ec2_bastion_public_ip" {
  description                     = "The Public IP address of the instance"
  value                           = module.ec2_bastion.public_ip
}
output "ec2_private-id" {
  description                     = "The ID of the instance"
  value                           = module.ec2_private.id
}
output "ec2_private-ip" {
  description                     = "The Private IP address of the instance"
  value                           = module.ec2_private.private_ip
}

