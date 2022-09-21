resource "null_resource" "waste" {
  depends_on                = [module.ec2_bastion]
  connection {
    type                    = "ssh"
    user                    = "ec2-user"
    password                = "DevOps321"
    host                    = aws_eip.bastion_eip.public_ip
#    private_key             = file("need/justfile.pem")
  }
  # Creation time provisioner
  provisioner "file" {
    source                 = "need/justfile.pem"
    destination            = "/tmp/justfile.pem"
  }
  # Remote_exec provisioner
  provisioner "remote-exec" {
    inline                 = [
      "sudo chmod 400 /tmp/justfile.txt"
    ]
  }
  provisioner "local-exec" {
    command                 = "echo VPC created on 'date' and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir             = "local-exec/"
    on_failure              = continue
  }



/*  # Destroy time provisioners
  provisioner "local-exec" {
    command                 = "echo VPC created on 'date' and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir             = "local-exec/"
    when                    = destroy
    on_failure              = continue
  }*/
}