module "alb-basic" {
  source             = "terraform-aws-modules/alb/aws"
  version            = "8.1.0"
  name               = "${local.name}-alb-basic"
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets            = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]
  security_groups = [module.loadbalancer_sg.security_group_id]

  http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      # action_type        = "forward"
    },
    /*    {
      port                          = 81
      protocol                      = "HTTP"
      action_type                   = "redirect"
      redirect                      = {
        port                        = "443"
        protocol                    = "HTTPS"
        status_code                 = "HTTP_301"
      }*/
    #this means their maps inside the list of it
    /*      port                          = 82
      protocol                      = "HTTP"
      action_type                   = "fixed-response"
      fixed_response                = {
        content_type                = "text/plain"
        message_body                = "Fixed message"
        status_code                 = "200"
      }
    }*/
  ]
  target_groups = [
    {
      name_prefix          = "app1-1"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check         = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      targets  = {
        my_targets_pvt1     = {
          depends_on        = module.ec2_private
          target_id         = module.ec2_private.id
          port              = 80
      },
/*        my_targets_pvt2     = {
          target_id         = module.ec2_private[*].id
          port              = 80
        }*/
      }
      tags                  = local.common_tags  #this is for target group tags

    }

  ]

  tags                      = local.common_tags # this is for ALB

}
