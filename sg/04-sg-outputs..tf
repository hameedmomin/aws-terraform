#For Bastion security group we needed
output "bastion_security_group_id" {
  value = module.public_bastion_sg.bastion_security_group_id
}
output "bastion_security_group_name" {
  value = module.public_bastion_sg.bastion_security_group_name
}
output "bastion_security_group_vpc_id" {
  value = module.public_bastion_sg.bastion_security_group_vpc_id
}


#Private securtiy group we needed it all
output "security_group_id" {
  value = module.private_sg.security_group_id
}
output "security_group_name" {
  value = module.private_sg.security_group_name
}
output "security_group_vpc_id" {
  value = module.private_sg.security_group_vpc_id
}