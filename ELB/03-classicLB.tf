module "classicLB" {
  source                          = "terraform-aws-modules/elb/aws"
  version                         = "3.0.1"

  name                            = "${local.name}-classicLoadbalancer"

  subnets                         = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]
  security_groups                 = module.loadbalancer_sg.security_group_id
 # internal                        = false

  listener = [
    {
      instance_port               = 80
      instance_protocol           = "HTTP"
      lb_port                     = 80
      lb_protocol                 = "HTTP"
    },
    {
      instance_port               = 8080
      instance_protocol           = "http"
      lb_port                     = 81
      lb_protocol                 = "http"
     # ssl_certificate_id = "arn:aws:acm:eu-west-1:235367859451:certificate/6c270328-2cd5-4b2d-8dfd-ae8d0004ad31"
    },
  ]

  health_check = {
    target                        = "HTTP:80/"
    interval                      = 30
    healthy_threshold             = 2
    unhealthy_threshold           = 2
    timeout                       = 5
  }

/*  access_logs                    = {
    bucket                       = "my-access-logs-bucket"
  }*/

  // ELB attachments
  number_of_instances            = var.private_instance_count
  instances                      = [
    module.ec2_private.id[0],
    module.ec2_private.id[1]
  ]

  tags                           = local.common_tags
}